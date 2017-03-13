// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$( document ).on('turbolinks:load', function() {
  $('.parallax').parallax();
  console.log("It works on each visit!")
  $(".button-collapse").sideNav();

  $('select').material_select();

  $('div .dropdown-menu').click(function(){
    console.log('hello bob!');
    $(' div .wth').toggle();
    });

  $('div .Aventura.Isles').click(function(){
    console.log('hello bob!');
    $('table.Aventura.Isles').toggleClass('testclass');
    });

  $('div .Kendall.Lakes').click(function(){
    console.log('hello bob!');
    $('table.Kendall.Lakes').toggleClass('testclass');
    });

  $('div .Grove.Palms').click(function(){
    console.log('hello bob!');
    $('table.Grove.Palms').toggleClass('testclass');
    });

  $('div .Biscayne.Vista').click(function(){
    console.log('hello bob!');
    $('table.Biscayne.Vista').toggleClass('testclass');






  });
  });



  // $('.target').pushpin({
  //     top: 0,
  //     bottom: 1000,
  //     offset: 0
  //   });
  //
  //   $('.modal').modal();

// function scrollAndToggle(elem) {
//   var position = $(elem).attr("href");
//   console.log(position);
//   $('html,body').animate({
//                scrollTop: $(position).offset().top - 150
//            }, "1000", "swing");
//   menuAction();
// }
