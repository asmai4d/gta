let datatables = [];

$(document).keyup(function(e) {
    if (e.key === "Escape") {
        $('body').addClass('d-none');
        $("#addinvoice, #manageinvoices, #showbills").addClass('d-none').removeClass('d-flex');
        $.post('http://zapps_billing/closeNUI', JSON.stringify({}));

        for(let i = 0; i < datatables.length; i++)
        {
            datatables[i].destroy();
            datatables.splice(i, 1);
        }
    }
});

$(document).ready(function() {
    let logos = [];

    window.addEventListener('message', function(event) {
        var item = event.data;
        console.log(item.action)
        if (item.action == 'addinvoice') {
            logos = [];
            $('#body').removeClass('d-none');
            $('#addinvoice').removeClass('d-none').addClass('d-flex');

            $("#newinvoiceSociety").html("");
            $("#newinvoiceTarget").html("");

            if(item.canSetPaytime)
            {
                $("#newinvoiceSelectpaytime").removeClass("d-none");
            }
            else
            {
                $("#newinvoiceSelectpaytime").addClass("d-none");
            }

            for(let i = 0; i < item.jobs.length; i++)
            {
                $("#newinvoiceSociety").append(new Option(item.jobs[i].name, i))
                logos[i] = item.jobs[i].logo;
            }

            $("#newinvoiceLogo").attr("src", item.jobs[0].logo)

            let peopleTitle = new Option("────[ PEOPLE ]────", "societies");
            peopleTitle.disabled = true
            $("#newinvoiceTarget").append(peopleTitle)
            for(let i = 0; i < item.nearby.length; i++)
            {
                $("#newinvoiceTarget").append(new Option(`[${item.nearby[i].id}] ${item.nearby[i].name}`, item.nearby[i].id))
            }

            let societiesTitle = new Option("────[ SOCIETIES ]────", "societies");
            societiesTitle.disabled = true
            $("#newinvoiceTarget").append(societiesTitle)
            for(let i = 0; i < item.societies.length; i++)
            {
                $("#newinvoiceTarget").append(new Option(item.societies[i].name, `s${i}`))
            }

            let alreadySent = false
            $("#newinvoiceAdd").click(function(e) {
                //First lets check if all required fields are set
                if(alreadySent) return;

                let society = $("#newinvoiceSociety").find(":selected");
                let target = $("#newinvoiceTarget").find(":selected");
                let amount = $("#newinvoiceAmount").val();
                let paytime = $("#newinvoicePaytime").val();
                let reason = $("#newinvoiceReason").val();

                if(!society || !target || !amount || (!paytime && item.canSetPaytime) || !reason)
                {
                    Swal.fire({
                        icon: 'error',
                        title: 'Missing arguments',
                        text: 'You need to fill in all fields before sending an invoice'
                    });
                }
                else
                {
                    //Since all fields are filled, let's check if their values are valid

                    //First lets check the delay (if it is in range)
                    if(item.canSetPaytime)
                    {
                        if(paytime > item.paytimeMax || paytime < item.paytimeMin)
                        {
                            Swal.fire({
                                icon: 'error',
                                title: 'Invalid time to pay',
                                text: `The time to pay invoice needs to be a value between ${item.paytimeMin} and ${item.paytimeMax} days`
                            });
                            return
                        }
                    }

                    if(amount < 0)
                    {
                        Swal.fire({
                            icon: 'error',
                            title: 'Invalid amount',
                            text: `You cannot set a negative amount!`
                        });
                        return
                    }

                    // Lets check if its a society targeted, if such then the first sign will be an 's'
                    let t = target.val();
                    if (t[0] == 's')
                    {
                        $.post('http://zapps_billing/addNewInvoice', JSON.stringify({
                            sendingSociety: item.jobs[society.val()].account,
                            sendingSocietyName: item.jobs[society.val()].name,
                            target: item.societies[t.substring(1)].account,
                            targetName: item.societies[t.substring(1)].name,
                            amount: amount,
                            paytime: paytime,
                            reason: reason
                        }));
                    }
                    else
                    {
                        $.post('http://zapps_billing/addNewInvoice', JSON.stringify({
                            sendingSociety: item.jobs[society.val()].account,
                            sendingSocietyName: item.jobs[society.val()].name,
                            target: t,
                            targetName: -1,
                            amount: amount,
                            paytime: paytime,
                            reason: reason
                        }));
                    }

                    alreadySent = true;

                    Swal.fire({
                        icon: 'success',
                        title: 'Successfully created invoice',
                        text: ``
                    }).then((r) => {
                        $('body').addClass('d-none');
                        $("#addinvoice, #manageinvoices, #showbills").addClass('d-none').removeClass('d-flex');
                        $.post('http://zapps_billing/closeNUI', JSON.stringify({}));
                        for(let i = 0; i < datatables.length; i++)
                        {
                            datatables[i].destroy();
                            datatables.splice(i, 1);
                        }
                    })
                }

            })
        }
        else if(item.action == "manageinvoices")
        {
            $('#body').removeClass('d-none');
            $('#manageinvoices').removeClass('d-none').addClass('d-flex');



            $("#manageInvoicesAuthorTableBody").empty();
            $("#manageInvoicesReceivedTableBody").empty();

            for(let i = 0; i < datatables.length; i++)
            {
                datatables[i].destroy();
                datatables.splice(i, 1);
            }

            $("#manageCompanyBalance").text(`Society balance: $${item.societyMoney}`);
            $("#manageCompanyTitle").text(`Manage ${item.society.name} Invoices`);
            $("#manageAuthorInvoicesTitle").text(`${item.society.name} Invoices`);

            $(".modal, .modal-backdrop").remove();

            let earned = 0;
            let expectedEarn = 0;
            let allInvoices = item.societyBillsAuthor.length;
            let unpaidInvoices = 0;

            let rows = '';

            for(let i = 0; i < item.societyBillsAuthor.length; i++)
            {
                let bill = item.societyBillsAuthor[i];

                if(bill.status == 2 || bill.status == 4)
                {
                    earned += bill.amount + bill.interest;
                }
                else if (bill.status == 1 || bill.status == 3)
                {
                    expectedEarn += bill.amount + bill.interest;
                    unpaidInvoices++;
                }

                let status = '';
                if (bill.status == 2)
                {
                    status = '<td class="text-success align-middle">Paid</td>'
                    btn = `<button type="button" class="btn btn-success btn-sm btn-payMyInvoice" data-invoiceId="${bill.id}" data-invoiceMoney="${bill.amount + bill.interest}" disabled>Pay</button>`;
                }
                else if (bill.status == 3)
                {
                    status = '<td class="text-danger align-middle">Delayed</td>'
                    btn = `<button type="button" class="btn btn-success btn-sm btn-payMyInvoice" data-invoiceId="${bill.id}" data-invoiceMoney="${bill.amount + bill.interest}">Pay</button>`;
                }
                else if (bill.status == 4)
                {
                    status = '<td class="text-primary align-middle">Autopaid</td>'
                    btn = `<button type="button" class="btn btn-success btn-sm btn-payMyInvoice" data-invoiceId="${bill.id}" data-invoiceMoney="${bill.amount + bill.interest}" disabled>Pay</button>`;
                }
                else if (bill.status == 1)
                {
                    status = '<td class="text-warning align-middle">Unpaid</td>'
                    btn = `<button type="button" class="btn btn-success btn-sm btn-payMyInvoice" data-invoiceId="${bill.id}" data-invoiceMoney="${bill.amount + bill.interest}">Pay</button>`;
                }
                else if (bill.status == 5)
                {
                    status = '<td class="align-middle">Cancelled</td>'
                    btn = `<button type="button" class="btn btn-success btn-sm btn-payMyInvoice" data-invoiceId="${bill.id}" data-invoiceMoney="${bill.amount + bill.interest}" disabled>Pay</button>`;
                }

                let interest = '';

                if (bill.interest > 0)
                {
                    interest = `<font class="text-warning">+ $${bill.interest}</font>`;
                }

                rows += `
<tr>
    ${status}
    <td class="align-middle">${bill.author_name}</td>
    <td class="align-middle">${bill.receiver_name}</td>
    <td class="align-middle">$${bill.amount} ${interest}</td>
    <td class="align-middle">
        <button type="button" class="btn btn-primary btn-sm btn-showInvoiceInfo" data-toggle="modal" data-target="#manageBillsAuthorModal${bill.id}" data-invoiceId="${bill.id}">Show</button>
    </td>
</tr>
                `;

                if (bill.status == 2)
                {
                    status = '<td class="text-success align-middle">Paid</td>'
                    btn = `<button type="button" class="btn btn-secondary btn-sm cancelInvoice" data-invoiceId="${bill.id}" disabled>Cancel Invoice</button>`;
                }
                else if (bill.status == 3)
                {
                    status = '<td class="text-danger align-middle">Delayed</td>'
                    btn = `<button type="button" class="btn btn-secondary btn-sm cancelInvoice" data-invoiceId="${bill.id}">Cancel Invoice</button>`;
                }
                else if (bill.status == 4)
                {
                    status = '<td class="text-primary align-middle">Autopaid</td>'
                    btn = `<button type="button" class="btn btn-secondary btn-sm cancelInvoice" data-invoiceId="${bill.id}" disabled>Cancel Invoice</button>`;
                }
                else if (bill.status == 1)
                {
                    status = '<td class="text-warning align-middle">Unpaid</td>'
                    btn = `<button type="button" class="btn btn-secondary btn-sm cancelInvoice" data-invoiceId="${bill.id}">Cancel Invoice</button>`;
                }
                else if (bill.status == 5)
                {
                    status = '<td class="align-middle">Cancelled</td>'
                    btn = `<button type="button" class="btn btn-secondary btn-sm cancelInvoice" data-invoiceId="${bill.id}" disabled>Cancel Invoice</button>`;
                }

                let modal = `
<div class="modal fade" id="manageBillsAuthorModal${bill.id}" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content bg-primary">
            <div class="modal-body text-center">
                <div class="row">
                    <div class="col mx-auto">
                        <h3 class="mb-0 pb-0">Invoice ${bill.id}</h3>
                        <p class="my-0 py-0">Status: ${status}</p>
                    </div>
                </div>
                <div class="row">
                    <div class="col-6">
                        <h5>Author</h5>
                        <p>${bill.author_name}</p>
                    </div>
                    <div class="col-6">
                        <h5>Amount</h5>
                        <p>$${bill.amount} ${interest}</p>
                    </div>
                </div>
                <div class="row">
                    <div class="col-6">
                        <h5>Time Created</h5>
                        <p>${bill.date_added}</p>
                    </div>
                    <div class="col-6">
                        <h5>Last Pay Date</h5>
                        <p>${bill.lastPayDate}</p>
                    </div>
                </div>
                <div class="row">
                    <div class="col-8 mx-auto">
                        <h5>Reason</h5>
                        <p>${bill.description}</p>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        ${btn}
                        <button class="btn btn-danger btn-sm" data-invoiceid="${bill.id}" data-dismiss="modal">Cancel</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
                `;

                $(body).append(modal);
            }

            $("#manageInvoicesAuthorTableBody").html(rows);
            datatables.push($("#manageInvoicesAuthorTable").DataTable({aaSorting: [], pageLength: 5, lengthMenu: [5, 10, 15, 20, 50, 100]}));

            rows = '';

            for(let i = 0; i < item.societyBillsReceiver.length; i++)
            {
                let bill = item.societyBillsReceiver[i];
                let status = '';
                if (bill.status == 2)
                {
                    status = '<td class="text-success align-middle">Paid</td>'
                    btn = `<button type="button" class="btn btn-success btn-sm payInvoice" data-invoiceId="${bill.id}" data-invoiceMoney="${bill.amount + bill.interest}" disabled>Pay</button>`;
                }
                else if (bill.status == 3)
                {
                    status = '<td class="text-danger align-middle">Delayed</td>'
                    btn = `<button type="button" class="btn btn-success btn-sm payInvoice" data-invoiceId="${bill.id}" data-invoiceMoney="${bill.amount + bill.interest}">Pay</button>`;
                }
                else if (bill.status == 4)
                {
                    status = '<td class="text-primary align-middle">Autopaid</td>'
                    btn = `<button type="button" class="btn btn-success btn-sm payInvoice" data-invoiceId="${bill.id}" data-invoiceMoney="${bill.amount + bill.interest}" disabled>Pay</button>`;
                }
                else if (bill.status == 1)
                {
                    status = '<td class="text-warning align-middle">Unpaid</td>'
                    btn = `<button type="button" class="btn btn-success btn-sm payInvoice" data-invoiceId="${bill.id}" data-invoiceMoney="${bill.amount + bill.interest}">Pay</button>`;
                }
                else if (bill.status == 5)
                {
                    status = '<td class="align-middle">Cancelled</td>'
                    btn = `<button type="button" class="btn btn-success btn-sm payInvoice" data-invoiceId="${bill.id}" data-invoiceMoney="${bill.amount + bill.interest}" disabled>Pay</button>`;
                }

                let interest = '';

                if (bill.interest > 0)
                {
                    interest = `<font class="text-warning">+ $${bill.interest}</font>`;
                }

                rows += `
<tr>
    ${status}
    <td class="align-middle">${bill.society_name}</td>
    <td class="align-middle">$${bill.amount} ${interest}</td>
    <td class="align-middle">${bill.lastPayDate}</td>
    <td class="align-middle">
        <button type="button" class="btn btn-primary btn-sm btn-showInvoiceInfo" data-toggle="modal" data-target="#manageBillsReceiverModal${bill.id}" data-invoiceId="${bill.id}">Show</button>
    </td>
</tr>
                `;

                let modal = `
<div class="modal fade" id="manageBillsReceiverModal${bill.id}" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content bg-primary">
            <div class="modal-body text-center">
                <div class="row">
                    <div class="col mx-auto">
                        <h3 class="mb-0 pb-0">Invoice ${bill.id}</h3>
                        <p class="my-0 py-0">Status: ${status}</p>
                    </div>
                </div>
                <div class="row">
                    <div class="col-6">
                        <h5>Author</h5>
                        <p>${bill.author_name}</p>
                    </div>
                    <div class="col-6">
                        <h5>Amount</h5>
                        <p>$${bill.amount} ${interest}</p>
                    </div>
                </div>
                <div class="row">
                    <div class="col-6">
                        <h5>Time Created</h5>
                        <p>${bill.date_added}</p>
                    </div>
                    <div class="col-6">
                        <h5>Last Pay Date</h5>
                        <p>${bill.lastPayDate}</p>
                    </div>
                </div>
                <div class="row">
                    <div class="col-8 mx-auto">
                        <h5>Reason</h5>
                        <p>${bill.description}</p>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        ${btn}
                        <button class="btn btn-danger btn-sm" data-invoiceid="${bill.id}" data-dismiss="modal">Cancel</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
                `;

                $(body).append(modal);
            }

            $("#manageInvoicesReceivedTableBody").html(rows);
            datatables.push[$("#manageInvoicesReceiverTable").DataTable({aaSorting: [], pageLength: 5, lengthMenu: [5, 10, 15, 20, 50, 100]})];

            $("#invoiceEarnings").text(`$${earned}`);
            $("#expectedEarnings").text(`$${expectedEarn}`);
            $("#allInvoicesCount").text(`${allInvoices}`);
            $("#unpaidInvoicesCount").text(`${unpaidInvoices}`);

            $(document).on('click', ".btn-showInvoiceInfo", function(e) {
                let modalId = $(this).attr('data-target');

                $(`${modalId}`).modal('show');
            });

            $(document).on('click', ".payInvoice", function(e) {
                let invoiceId = $(this).attr('data-invoiceid');

                let cost = $(this).attr('data-invoiceMoney');

                if(cost > item.societyMoney)
                {
                    Swal.fire({
                        icon: 'error',
                        title: 'Not enough money!',
                        text: `You don't have enough money to pay this bill`
                    });
                    return
                }

                item.accountMoney -= cost;

                $.post('http://zapps_billing/paySocietyInvoice', JSON.stringify({
                    billId: invoiceId
                }));

                Swal.fire({
                    icon: 'success',
                    title: 'Successfully paid invoice',
                    text: ``
                }).then((r) => {
                    $('body').addClass('d-none');
                    $("#addinvoice, #manageinvoices, #showbills").addClass('d-none').removeClass('d-flex');
                    $.post('http://zapps_billing/closeNUI', JSON.stringify({}));
                    for(let i = 0; i < datatables.length; i++)
                    {
                        datatables[i].destroy();
                        datatables.splice(i, 1);
                    }
                })
            });

            $(document).on('click', ".cancelInvoice", function(e) {
                let invoiceId = $(this).attr('data-invoiceid');

                $.post('http://zapps_billing/cancelInvoice', JSON.stringify({
                    billId: invoiceId
                }));

                Swal.fire({
                    icon: 'success',
                    title: 'Successfully cancelled invoice',
                    text: ``
                }).then((r) => {
                    $('body').addClass('d-none');
                    $("#addinvoice, #manageinvoices, #showbills").addClass('d-none').removeClass('d-flex');
                    $.post('http://zapps_billing/closeNUI', JSON.stringify({}));
                    for(let i = 0; i < datatables.length; i++)
                    {
                        datatables[i].destroy();
                        datatables.splice(i, 1);
                    }
                })
            });
        }
        else if(item.action == "showbills")
        {
            $('#body').removeClass('d-none');
            $('#showbills').removeClass('d-none').addClass('d-flex');
            $("#myInvoicesBalance").text(`Your balance: $${item.accountMoney}`);

            let rows = '';

            for(let i = 0; i < item.bills.length; i++)
            {
                let bill = item.bills[i];
                let status = '';
                let btn = '';
                if (bill.status == 2)
                {
                    status = '<td class="text-success align-middle">Paid</td>'
                    btn = `<button type="button" class="btn btn-success btn-sm btn-payMyInvoice" data-invoiceId="${bill.id}" data-invoiceMoney="${bill.amount + bill.interest}" disabled>Pay</button>`;
                }
                else if (bill.status == 3)
                {
                    status = '<td class="text-danger align-middle">Delayed</td>'
                    btn = `<button type="button" class="btn btn-success btn-sm btn-payMyInvoice" data-invoiceId="${bill.id}" data-invoiceMoney="${bill.amount + bill.interest}">Pay</button>`;
                }
                else if (bill.status == 4)
                {
                    status = '<td class="text-primary align-middle">Autopaid</td>'
                    btn = `<button type="button" class="btn btn-success btn-sm btn-payMyInvoice" data-invoiceId="${bill.id}" data-invoiceMoney="${bill.amount + bill.interest}" disabled>Pay</button>`;
                }
                else if (bill.status == 1)
                {
                    status = '<td class="text-warning align-middle">Unpaid</td>'
                    btn = `<button type="button" class="btn btn-success btn-sm btn-payMyInvoice" data-invoiceId="${bill.id}" data-invoiceMoney="${bill.amount + bill.interest}">Pay</button>`;
                }
                else if (bill.status == 5)
                {
                    status = '<td class="align-middle">Cancelled</td>'
                    btn = `<button type="button" class="btn btn-success btn-sm btn-payMyInvoice" data-invoiceId="${bill.id}" data-invoiceMoney="${bill.amount + bill.interest}" disabled>Pay</button>`;
                }

                let interest = '';

                if (bill.interest > 0)
                {
                    interest = `<font class="text-warning">+ $${bill.interest}</font>`;
                }

                rows += `
<tr>
    <td class="align-middle">${bill.id}</td>
    ${status}
    <td class="align-middle">${bill.society_name}</td>
    <td class="align-middle">$${bill.amount} ${interest}</td>
    <td class="align-middle">${bill.description}</td>
    <td class="align-middle">${bill.lastPayDate}</td>
    <td class="align-middle">
        ${btn}
    </td>
</tr>
                `
            }

            $("#yourInvoicesTableBody").html(rows);
            datatables.push($("#yourInvoicesTable").DataTable({aaSorting: []}));

            $(document).on('click', ".btn-payMyInvoice", function(e) {
                let invoiceId = $(this).attr('data-invoiceId');
                let cost = $(this).attr('data-invoiceMoney');

                if(cost > item.accountMoney)
                {
                    Swal.fire({
                        icon: 'error',
                        title: 'Not enough money!',
                        text: `You don't have enough money to pay this bill`
                    });
                    return
                }

                item.accountMoney -= cost;

                $.post('http://zapps_billing/payInvoice', JSON.stringify({
                    billId: invoiceId
                }));

                Swal.fire({
                    icon: 'success',
                    title: 'Successfully paid invoice',
                    text: ``
                }).then((r) => {
                    $('body').addClass('d-none');
                    $("#addinvoice, #manageinvoices, #showbills").addClass('d-none').removeClass('d-flex');
                    $.post('http://zapps_billing/closeNUI', JSON.stringify({}));
                    for(let i = 0; i < datatables.length; i++)
                    {
                        datatables[i].destroy();
                        datatables.splice(i, 1);
                    }
                })
            });


        }
    });

    $("#newinvoiceSociety").change(function() {
        let id = $(this).val();
        $("#newinvoiceLogo").attr("src", logos[id]);
    });

    $("#newinvoiceCancel, #yourinvoicesClose").click(function(e) {
        $('body').addClass('d-none');
        $("#addinvoice, #manageinvoices, #showbills").addClass('d-none').removeClass('d-flex');
        $.post('http://zapps_billing/closeNUI', JSON.stringify({}));
        for(let i = 0; i < datatables.length; i++)
        {
            datatables[i].destroy();
            datatables.splice(i, 1);
        }
    });
})