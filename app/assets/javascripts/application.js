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
  $('.modal').modal();
  $('select').material_select();

  $('div .dropdown-menu').click(function(){
    console.log('hello bob!');
    $(' div .wth').toggle();
    });

    $('div .Aventura.Harbor.Apartments').click(function(){
  console.log('hello bob!');
  $('table.Aventura.Harbor.Apartments').toggleClass('testclass');
  });

$('div .Kendall.Lakes').click(function(){
  console.log('hello bob!');
  $('table.Kendall.Lakes').toggleClass('testclass');
  });

  $('div .Cypress.Place.Holdings').click(function(){
    console.log('hello bob!');
    $('table.Cypress.Place.Holdings').toggleClass('testclass');
  });

$('div .Grove.Palms').click(function(){
  console.log('hello bob!');
  $('table.Grove.Palms').toggleClass('testclass');
  });

$('div .Biscayne.Vista').click(function(){
  console.log('hello bob!');
  $('table.Biscayne.Vista').toggleClass('testclass');
  });

  $('div .Royalton.on.the.Green.Apartments').click(function(){

    $('table.Royalton.on.the.Green.Apartments').toggleClass('testclass');
    });

  $('div .Lago.Club').click(function(){

    $('table.Lago.Club').toggleClass('testclass');
    });

  $('div .Intracoastal.Yacht.Club').click(function(){

    $('table.Intracoastal.Yacht.Club').toggleClass('testclass');
    });

  $('div .Colony.at.Dadeland').click(function(){

    $('table.Colony.at.Dadeland').toggleClass('testclass');
    });

  $('div .Royal.Palms').click(function(){

    $('table.Royal.Palms').toggleClass('testclass');
    });

  $('div .Suncoast.Place').click(function(){

    $('table.Suncoast.Place').toggleClass('testclass');
    });

  $('div .Stadium.Tower').click(function(){

    $('table.Stadium.Tower').toggleClass('testclass');
    });

  $('div .Brickell.First').click(function(){

    $('table.Brickell.First').toggleClass('testclass');
    });

  $('div .Sunshine.Lakes.Apartments').click(function(){

    $('table.Sunshine.Lakes.Apartments').toggleClass('testclass');
    });


  $('div .Cypress.Place.Holdings').click(function(){

    $('table.Cypress.Place.Holdings').toggleClass('testclass');
    });

  $('div .Miami.Riverfront.Residences').click(function(){

    $('table.Miami.Riverfront.Residences').toggleClass('testclass');
    });


  $('div .Gables.37').click(function(){

    $('table.Gables.37').toggleClass('testclass');
    });


  $('div .Cypress.Place.Holdings').click(function(){

    $('table.Cypress.Place.Holdings').toggleClass('testclass');
    });


  $('div .2500.Inverrary.Club.Apartments').click(function(){

    $('table.2500.Inverrary.Club.Apartments').toggleClass('testclass');
    });

  $('div .Inverarry.441.Apartments').click(function(){

    $('table.Inverarry.441.Apartments').toggleClass('testclass');
    });

  $('div .Country.Club.Towers').click(function(){

    $('table.Country.Club.Towers').toggleClass('testclass');
    });

  $('div .Cherry.Grove.Village.Apartments').click(function(){

    $('table.Cherry.Grove.Village.Apartments').toggleClass('testclass');
    });

  $('div .Fontainebleau.Milton').click(function(){

    $('table.Fontainebleau.Milton').toggleClass('testclass');
    });

  $('div .International.Club.Apartments').click(function(){

    $('table.International.Club.Apartments').toggleClass('testclass');
    });

  $('div .Las.Brisas.Gardens.Apts').click(function(){

    $('table.Las.Brisas.Gardens.Apts').toggleClass('testclass');
    });

  $('div .Miami.Bay.Waterfront.Midtown.Residences').click(function(){

    $('table.Miami.Bay.Waterfront.Midtown.Residences').toggleClass('testclass');
    });

  $('div .Westland.49.Apartments').click(function(){

    $('table.Westland.49.Apartments').toggleClass('testclass');





      $('.target').pushpin({
          top: 0,
          bottom: 1000,
          offset: 0
        });


  });
  });





// function scrollAndToggle(elem) {
//   var position = $(elem).attr("href");
//   console.log(position);
//   $('html,body').animate({
//                scrollTop: $(position).offset().top - 150
//            }, "1000", "swing");
//   menuAction();
// }
