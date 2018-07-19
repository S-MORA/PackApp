// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function() {
  if (document.querySelector('body.landing.index') == undefined) {
    return;
  }

  new WOW().init();

  $('a.page-scroll').bind('click', function(event) {
    var $ele = $(this);
    $('html, body').stop().animate({
      scrollTop: ($($ele.attr('href')).offset().top - 60)
    }, 1450, 'easeInOutExpo');
    event.preventDefault();
  });

  $('.navbar-collapse ul li a').click(function() {
    $('.navbar-toggle:visible').click();
  });

});