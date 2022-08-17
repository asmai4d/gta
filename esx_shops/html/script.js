
$(function() {
		window.addEventListener('message', function(event) {
			if (event.data.type == 'shop') {
				$('#wrapper').fadeIn();
				$('#menuwrap').fadeIn();
				$('#bg').fadeIn();
				$('.shoptitle').html(event.data.name);

			var i1;
			var id = 750;

			if (event.data.result.length > 10) {
				for (i1 = 0; i1 < (event.data.result.length -10) / 5; i1++) { 
					
					$('#itembox').append(
						`<div class="line" style = "top: ${id}px; position: relative;"></div>`
					);

					id = id + 375
				}
			}

			var i;
			
			for (i = 0; i < event.data.result.length; i++) {
		
				$('#itembox').append(
					`<div class = "image" id = ${event.data.result[i].item} label = "${event.data.result[i].label}" count = ${event.data.result[i].count} price = ${event.data.result[i].price}>
						<img src="//esx_inventoryhud/html/img/items/${event.data.result[i].item}.png" width="120px"/>
						<div class="textwrap">
						<h3 class = "h4">${event.data.result[i].label}</h3>
						<h4 class = "price">$${event.data.result[i].price}</h4>
						</div>
					</div>`
				);
			}

			if (event.data.owner == true) {

				$('#menuwrap').prepend(
					`
					<button class = "button" id = "bossactions">Boss Menu</button>
					`
				);
			}

			var CartCount = 0;

			$('.image').on('click', function () {
				$("#cart").load(location.href + " #cart");

				$('.carticon').fadeIn();
				$('.shoptitle').css('left', '80px');

				CartCount = CartCount + 1;
				var item = $(this).attr('id');
				var label = $(this).attr('label');
				var count = $(this).attr('count');
				var price = $(this).attr('price');
				$('#cartCount').html(CartCount);

				$("#" + item).hide();
			

				$.post('https://esx_shops/putcart', JSON.stringify({item: item, price : price, label : label, id : id}), function( cb ) {

					$('#cart').html('<div id="cart_inner"></div>');

					var i;
					for (i = 0; i < cb.length; i++) { 

						$('#cart_inner').append(
							`<div class = "cartitem" label = ${cb[i].label} count = ${cb[i].count} price = ${cb[i].price}>
							<span class="remove" label= ${cb[i].label} item = ${cb[i].item}>x</span><h4 class="cartlabel">${cb[i].label}<span class="priceperitem">$${cb[i].price}</span></h4>
							<div class="quantity"><span class="amount">Quantity:</span><input type="text" maxlength="2" id = ${cb[i].item} class = "textareas" placeholder = "" value="1" /></div>
							</div>`
								);
							};

							$('#cart').append(
							`<div class="ctitle" style = "position: absolute; top: 10px;">Shopping Cart</div>
							<button class = "button" id = "back" style = "position: absolute; left: 15px; top: 15px;">return to shop</button>
							<div id="buy"><button class = "purchase" id = "buybutton">Purchase</button></div>
							`
						);

					$('.remove').on('click', function () {
						var label = $(this).attr('label');
						var item = $(this).attr('item');
					    if(CartCount > 0){
    						CartCount = CartCount - 1;
    					}
    					$('#cartCount').html(CartCount);
    					$("#" + item).show();
    					console.log(item)
						$('.cartitem[label='+label+']').fadeOut(400, function() {
        					$(this).remove();
        					$.post('https://esx_shops/removecart', JSON.stringify({item: item}), function( cb ) {});
    					});
					});

				});
			});
	
			
			$('.carticon').on('click', function () {
				$('#cart').fadeIn();
				$('#wrapper').fadeOut();
				$('.carticon').fadeOut();
				$('#bg').fadeOut();
			});

			$("body").on("click", "#back", function() {
				$('#cart').fadeOut();
				$('#wrapper').fadeIn();
				$('.carticon').fadeIn();
				$('#bg').fadeIn();
			});

			$("body").on("click", "#buybutton", function() {
				var value = document.getElementsByClassName("textareas");

				for (i = 0; i < value.length; i++) {

					var isNumber = isNaN(value[i].value) === false;

					var count = $('#' + value[i].id).attr('count');

					if (parseInt(value[i].value) != 0 && parseInt(value[i].value) <= 20 && isNumber) {

						$.post('https://esx_shops/escape', JSON.stringify({}));
					
						location.reload(true);

						$('#wrapper').fadeOut();
						$('#payment').fadeOut();
						$('#cart').fadeOut();
						var zone = event.data.name;
						$.post('https://esx_shops/buy', JSON.stringify({Count : value[i].value, Item : value[i].id, Zone: zone}));
					} 
					else {
						$.post('https://esx_shops/notify', JSON.stringify({msg : "~r~One of the item does not have enough stock or the amount is invalid."}));
					}
				}
			});

			
			$("body").on("click", "#bossactions", function() {
				$.post('https://esx_shops/bossactions', JSON.stringify({}));
				$.post('https://esx_shops/escape', JSON.stringify({}));
				location.reload(true);
				$.post('https://esx_shops/emptycart', JSON.stringify({}));
				$('#wrapper').fadeOut();
				$('#payment').fadeOut();
				$('#cart').fadeOut();
			});
		}
	});

	


	document.onkeyup = function (data) {
		if (data.which == 27) { // Escape key
			$.post('https://esx_shops/escape', JSON.stringify({}));
			location.reload(true);
			$.post('https://esx_shops/emptycart', JSON.stringify({}));
			$('#wrapper').fadeOut();
			$('#menuwrap').fadeOut();
			$('#bg').fadeOut();
			$('#payment').fadeOut();
			$('#cart').fadeOut();
		}
	}
});
