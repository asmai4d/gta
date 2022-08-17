function display(bool) {
    if (bool) {
        changeCount()
        $('#input').val("1")
        $('#container').fadeIn();
    } else {
        $('#items-right').empty();
        $('#items-left').empty();
        $('#container').fadeOut(); 
    }
}

let count = 0

$(function() {
    display(false)

    $("#items-left").droppable({
        drop: function(event, ui) {
            var type = $(ui.draggable).attr("data-dragType")
            if (type == 'locker') {
                $.post(`https://${GetParentResourceName()}/toInventory`, JSON.stringify({
                    name: $(ui.draggable).attr("data-name"),
                    count: $('#input').val(), 
                    type: $(ui.draggable).attr("data-type"), 
                    ammo: $(ui.draggable).attr("data-ammo"), 
                }));
            }
        }
    });
    $("#items-right").droppable({
        drop: function(event, ui) {
            var type = $(ui.draggable).attr("data-dragType")
            if (type == 'inv') {
                $.post(`https://${GetParentResourceName()}/toLocker`, JSON.stringify({
                    name: $(ui.draggable).attr("data-name"),
                    count: $('#input').val(), 
                    type: $(ui.draggable).attr("data-type"), 
                    ammo: $(ui.draggable).attr("data-ammo"), 
                }));
            }
        }
    });

    window.addEventListener("message", function(event) {
        let e = event.data
        if (e.action == "open") {
            display(true)
        };

        if (e.action == "close") {
            display(false)
        };

        if (e.action == "addInventoryItem") {
            addInventoryItem(e.name, e.label, e.count, e.type, e.ammo)
        };

        if (e.action == "addLockerItem") {
            addLockerItem(e.name, e.label, e.count, e.type, e.ammo, e.realname)
            changeCount()
        };
    })
})


function addInventoryItem(name, label, count, type, ammo) {
    let item = $("#items-left").find(`[data-name="${name}"]`)
    if ($(item).html()) {
        if (count <= 0){
            $(item).remove()
        } else {
            $(item).find("#item-left-count").text(count+"x")
            $(item).attr("data-count", count)
        }
    } else {
        if (count <= 0){

        }else {
            $('#items-left').append(`
            <div id="item-left" data-name="`+name+`" data-label="`+label+`" data-type="`+type+`" data-ammo="`+ammo+`" data-count="`+count+`" oncontextmenu="fn('`+name+`', '`+type+`', 'inv', '`+ammo+`')" ondblclick="switchAll('`+name+`', '`+type+`', 'inv', this, '`+ammo+`')">
            <svg class="item-left-background">
            <rect id="item-left-background" rx="7" ry="7" x="0" y="0" width="161" height="100">
            </rect>
            </svg>
            <img class="draggable" data-dragType="inv" data-name="`+name+`" data-label="`+label+`" data-type="`+type+`" data-ammo="`+ammo+`" data-count="`+count+`" id="item-left-png" src="img/items/`+name+`.png">
            <div id="item-left-name">
            <span>`+label+`</span>
            </div>
            <div id="item-left-count">
            <span>`+count+`x</span>
            </div>
            </div>
        `);
        $('.draggable').draggable({
            helper: 'clone',
            appendTo: 'body',
            zIndex: 99999,
            revert: 'invalid',
            cursorAt: {left: 33.5, top: 33.5},
        });
        }
    } 
}

function closeUI() {
    $.post(`https://${GetParentResourceName()}/close`, JSON.stringify({}));
}

function changeCount() {
    $.post(`https://${GetParentResourceName()}/getlockerSize`, JSON.stringify({}), function(data){ 
        $("#kilospan").html(`<span>`+data.size+` /</span><span style="color:rgba(143,164,191,1);"> `+data.maxsize+` KG</span>`)
    });
}

function addLockerItem(name, label, count, type, ammo, realname) {
    let item = $("#items-right").find(`[data-name="${name}"]`)
    if ($(item).html()) {
        if (count <= 0){
            $(item).remove()
        } else {
            $(item).find("#item-left-count").text(count+"x")
            $(item).attr("data-count", count)
        }
    } else {
        if (count <= 0){

        }else {
            if (type == "item") {
                $('#items-right').append(`
                <div id="item-left" data-name="`+name+`" data-label="`+label+`" data-type="`+type+`" data-ammo="`+ammo+`" data-count="`+count+`" oncontextmenu="fn('`+name+`', '`+type+`', 'locker', '`+ammo+`')" ondblclick="switchAll('`+name+`', '`+type+`', 'locker', this, '`+ammo+`')">
                <svg class="item-left-background">
                <rect id="item-left-background" rx="7" ry="7" x="0" y="0" width="161" height="100">
                </rect>
                </svg>
                <img class="draggable" data-dragType="locker" data-name="`+name+`" data-label="`+label+`" data-type="`+type+`" data-ammo="`+ammo+`" data-count="`+count+`" id="item-left-png" src="img/items/`+name+`.png" >
                <div id="item-left-name">
                <span>`+label+`</span>
                </div>
                <div id="item-left-count">
                <span>`+count+`x</span>
                </div>
                </div>
            `);
            } else {
                $('#items-right').append(`
                <div id="item-left" data-name="`+name+`" data-label="`+label+`" data-type="`+type+`" data-ammo="`+ammo+`" data-count="`+count+`" oncontextmenu="fn('`+name+`', '`+type+`', 'locker', '`+ammo+`')" ondblclick="switchAll('`+name+`', '`+type+`', 'locker', this, '`+ammo+`')">
                <svg class="item-left-background">
                <rect id="item-left-background" rx="7" ry="7" x="0" y="0" width="161" height="100">
                </rect>
                </svg>
                <img class="draggable" data-dragType="locker" data-name="`+name+`" data-label="`+label+`" data-type="`+type+`" data-ammo="`+ammo+`" data-count="`+count+`" id="item-left-png" src="img/items/`+realname+`.png" >
                <div id="item-left-name">
                <span>`+label+`</span>
                </div>
                <div id="item-left-count">
                <span>`+count+`x</span>
                </div>
                </div>
            `);
            }
   
        $('.draggable').draggable({
            helper: 'clone',
            appendTo: 'body',
            zIndex: 99999,
            revert: 'invalid',
            cursorAt: {left: 33.5, top: 33.5},
        });
        }
    } 
}

function switchAll (item, type, data, th, ammo) {
    let val = $(th).attr("data-count")
    console.log(val)
    if (data == "locker") {
        $.post(`https://${GetParentResourceName()}/toInventory`, JSON.stringify({
            name: item,
            count: val, 
            type: type, 
            ammo: ammo, 
        }));
    } else if (data == "inv") {
        $.post(`https://${GetParentResourceName()}/toLocker`, JSON.stringify({
            name: item,
            count: val, 
            type: type, 
            ammo: ammo, 
        }));
    };
}

function fn(item, type, data, ammo){
    if (data == "locker") {
        $.post(`https://${GetParentResourceName()}/toInventory`, JSON.stringify({
            name: item,
            count: $('#input').val(), 
            type: type, 
            ammo: ammo, 
        }));
    } else if (data == "inv") {
        $.post(`https://${GetParentResourceName()}/toLocker`, JSON.stringify({
            name: item,
            count: $('#input').val(), 
            type: type, 
            ammo: ammo, 
        }));
    };
}