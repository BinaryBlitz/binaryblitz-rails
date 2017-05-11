$(document).ready(function() {

  // Burger menu
  $('.burger-wrap').click(function(){
    $(this).children().toggleClass('active');
    $('.nav ul').toggleClass('active');
    return false;
  });

  // Calc inputs

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

  $('.calc-slider').on('afterChange', function(slick, currentSlide){

    if( currentSlide.currentSlide > 0 ) {
      $('.calc-prev').addClass('active');
    } else {
      $('.calc-prev').removeClass('active');
    }

    if( currentSlide.currentSlide == $('.calc-item').size() -1 ) {
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

  // Calc slider

  $('.calc-slider').slick({
    speed: 300,
    dots: true,
    arrows: false,
    draggable: false,
    swipe: false,
    infinite: false
  });

  // Fancybox

  $('.fancybox').fancybox({
    padding: 0
  });

});
