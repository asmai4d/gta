$(document).ready(function () {
  var idEnt = 0;
  var documentWidth = document.documentElement.clientWidth;
  var documentHeight = document.documentElement.clientHeight;
  var cursorX = documentWidth / 2;
  var cursorY = documentHeight / 2;
  UpdateCursorPos()
  function UpdateCursorPos() {
    $('#cursorPointer').css('left', cursorX);
    $('#cursorPointer').css('top', cursorY);
  }
  var target = false
  window.addEventListener('message', function (event) {
    if (event.data.menu == 'vehicle') {
      $(".menu-car").show()
      $("#carmenu").show()
      $("#carmenu2").hide()
      $(".crosshair").show()
      $("#cursorPointer").hide()
      target = true
      idEnt = event.data.idEntity;
    }
    if (event.data.menu == 'user') {
      $(".menu-user").show()
      $("#carmenu").hide()
      $("#carmenu2").hide()
      $(".crosshair").show()
      $("#cursorPointer").hide()
      target = true
      idEnt = event.data.idEntity;
    }

    if (event.data.crosshair == true && target == false ) {
      $("#cursorPointer").show()

    }
    if (event.data.crosshair == false) {
      $("#cursorPointer").hide()
    }

  
  });


  $('.openCoffre').on('click', function (e) {
    $(".menu").hide()
    $(".crosshair").hide()
    $.post('http://menu/togglecoffre', JSON.stringify({
      id: idEnt
    }));
  });

  $('.openCapot').on('click', function (e) {
    e.preventDefault();
    $("#carmenu").hide()
    $("#carmenu2").show()
 
  });

  $('.lock').on('click', function (e) {
      e.preventDefault();
    $.post('http://menu/togglelock', JSON.stringify({
      id: idEnt
    }));
  });

  // Functions
  // User
  $('.cheer').on('click', function (e) {
      e.preventDefault();
    $.post('http://menu/cheer', JSON.stringify({
      id: idEnt
    }));
  });



  $('.ld').on('click', function (e) {
      e.preventDefault();
    var type = "ld"
    $.post('http://menu/opend', JSON.stringify({
      id: idEnt,
      type: type
    }));
  });

  $('.rd').on('click', function (e) {
      e.preventDefault();
    var type = "rd"
    $.post('http://menu/opend', JSON.stringify({
      id: idEnt,
      type: type
    }));
  });

  $('.lbd').on('click', function (e) {
      e.preventDefault();

    var type = "lbd"
    $.post('http://menu/opend', JSON.stringify({
      id: idEnt,
      type: type
    }));
  });


  $('.rbd').on('click', function (e) {
      e.preventDefault();

    var type = "rbd"
    $.post('http://menu/opend', JSON.stringify({
      id: idEnt,
      type: type
    }));
  });

  $('.capot').on('click', function (e) {
      e.preventDefault();

    var type = "capot"
    $.post('http://menu/opend', JSON.stringify({
      id: idEnt,
      type: type
    }));
  });

  $('.trunk').on('click', function (e) {
      e.preventDefault();

    var type = "trunk"
    $.post('http://menu/opend', JSON.stringify({
      id: idEnt,
      type: type
    }));
  });

  $('.alld').on('click', function (e) {
      e.preventDefault();

    var type = "alld"
    $.post('http://menu/opend', JSON.stringify({
      id: idEnt,
      type: type
    }));
  });

  $('.engine').on('click', function (e) {
      e.preventDefault();
    var type = "engine"
    $.post('http://menu/opend', JSON.stringify({
      id: idEnt,
      type: type
    }));
  });




  $('.givemoney').on('click', function (e) {
    // e.preventDefault();
  $.post('http://menu/givemoney', JSON.stringify({
    id: idEnt
  }));
});

$('.arms').on('click', function (e) {
  // e.preventDefault();
$.post('http://menu/arms', JSON.stringify({
  id: idEnt
}));
});
  
$('.mash').on('click', function (e) {
    // e.preventDefault();
  $.post('http://menu/mash', JSON.stringify({
    id: idEnt
  }));
});

  
$('.revive').on('click', function (e) {
  // e.preventDefault();
$.post('http://menu/revive', JSON.stringify({
  id: idEnt
}));
});

  $('.tanec1').on('click', function (e) {
    // e.preventDefault();
  $.post('http://menu/tanec1', JSON.stringify({
    id: idEnt
  }));
  });
  $('.tanec2').on('click', function (e) {
    // e.preventDefault();
  $.post('http://menu/tanec2', JSON.stringify({
    id: idEnt
  }));
  });

  $('.tanec3').on('click', function (e) {
    // e.preventDefault();
  $.post('http://menu/tanec3', JSON.stringify({
    id: idEnt
  }));
  });

  $('.tanec4').on('click', function (e) {
    // e.preventDefault();
  $.post('http://menu/tanec4', JSON.stringify({
    id: idEnt
  }));
  });





  $('.crosshair').on('click', function (e) {
      e.preventDefault();
    $(".menu").hide()
    $(".crosshair").hide()
     target = false
    $.post('http://menu/disablenuifocus', JSON.stringify({
      nuifocus: false
    }));
  });
  $(document).keypress(function (e) {
      e.preventDefault();
    if (e.which == 101) { // if "E" is pressed
      $(".menu").hide()
      $(".crosshair").hide()
       target = false
      $.post('http://menu/disablenuifocus', JSON.stringify({
        nuifocus: false
      }));
    }
  });

});
