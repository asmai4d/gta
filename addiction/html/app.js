
window.addEventListener('message', function(e) {
	$("#container").stop(false, true);
    if (e.data.displayWindow == 'true') {
        $("#container").css('opacity', e.data.opacityValue);
        $("#container").css('display', 'flex');
    } else {
		$("#container").css('display', 'none');
    }
});

