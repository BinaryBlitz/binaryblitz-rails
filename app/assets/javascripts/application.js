// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require jquery
//= require turbolinks
//= require fancybox
//= require slick.js.js
//= require_tree .

$(document).on('turbolinks:load', function() {
  // Burger menu
  $('.burger-wrap').click(function(){
    $(this).children().toggleClass('active');
    $('.nav ul').toggleClass('active');
    return false;
  });

  // Calculator inputs
  $('.calc-select').click(function() {

    var radio = false;

    if( $(this).find('input').attr('type') == "radio" ) {
      radio = true;
    }

    if( radio ) {
      $(this).parent().find('.calc-select').removeClass('active');
      $(this).addClass('active');
    }

    else {
      if( $(this).hasClass('active') ) {
        $(this).removeClass('active');
      }
      else {
        $(this).addClass('active');
      }
    }

    $(this).find('input').prop('checked', true);
  });

  // Slick (calculator slider)
  $('.calc-slider').on('afterChange', function(slick, currentSlide){

    if( currentSlide.currentSlide > 0 ) {
      $('.calc-prev').addClass('active');
    } else {
      $('.calc-prev').removeClass('active');
    }

    if (currentSlide.currentSlide == $('.calc-item').length - 1) {
      $('.calc-submit').addClass('active');
      $('.calc-next').removeClass('active');
    } else {
      $('.calc-submit').removeClass('active');
      $('.calc-next').addClass('active');
    }
  });

  $('.calc-next').click(function() {
    $('.calc-slider').slick('slickNext');
    return false;
  });

  $('.calc-prev').click(function() {
    $('.calc-slider').slick('slickPrev');
    return false;
  });

  $('.calc-slider').slick({
    speed: 300,
    dots: true,
    arrows: false,
    draggable: false,
    swipe: false,
    infinite: false
  });

  // Jobs

  $('.open-job-head').click(function(){
    var content = $(this).next();
    var parent = $(this).parent().parent();

    if (parent.hasClass('active')) {
      content.slideUp();
      parent.removeClass('active');
    } else {
      $('.open-job-content').slideUp();
      $('.open-job-item').removeClass('active');
      content.slideDown();
      parent.addClass('active');
    }
  });
});
