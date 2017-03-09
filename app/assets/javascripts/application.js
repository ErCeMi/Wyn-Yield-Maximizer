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

  $("#employees th a, #employees .pagination a").on("click", function() {
    $.getScript(this.href);
    return false;
  });
  $("#employees_search input").keyup(function() {
    $.get($("#employees_search").attr("action"), $("#employees_search").serialize(), null, "script");
    return false;
  });






    $('#databutton').on('click', function() {
    var pdf = new jsPDF('landscape');
    // source can be HTML-formatted string, or a reference
    // to an actual DOM element from which the text will be scraped.
    source = $("#data")[0];

    // we support special element handlers. Register them with jQuery-style
    // ID selector for either ID or node name. ("#iAmID", "div", "span" etc.)
    // There is no support for any other type of selectors
    // (class, of compound) at this time.
    specialElementHandlers = {
        // element with id of "bypass" - jQuery style selector
        '#bypassme': function (element, renderer) {
            // true = "handled elsewhere, bypass text extraction"
            return true
        }
    };
    margins = {
        top: 10,
        bottom: 10,
        left: 10,
        width: 522


    };
    // all coords and widths are in jsPDF instance's declared units
    // 'inches' in this case
    pdf.fromHTML(
    source, // HTML string or DOM elem ref.
    margins.left, // x coord
    margins.top, { // y coord
        'width': margins.width, // max width of content on PDF
        'elementHandlers': specialElementHandlers
    },

    function (dispose) {
        // dispose: object with X, Y of the last line add to the PDF
        //          this allow the insertion of new lines after html
        pdf.save('Test.pdf');
    }, margins);

});

  })

// function scrollAndToggle(elem) {
//   var position = $(elem).attr("href");
//   console.log(position);
//   $('html,body').animate({
//                scrollTop: $(position).offset().top - 150
//            }, "1000", "swing");
//   menuAction();
// }
