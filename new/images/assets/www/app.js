var main = function() {
  
    var autoNext = setInterval(function() {sliding()}, 10000);
  
    $('.dropdown-toggle').mouseenter(function() {
        $('.dropdown-menu').toggle();
    });
  
    $('.dropdown-toggle').click(function() {
        $('.dropdown-menu').toggle();
    });
  
    $('.dropdown-menu').mouseleave(function() {
       $(this).toggle();
    });
  
    
    $('.arrow-next').click(function() {
        var currentSlide = $('.active-slide');
        var nextSlide = currentSlide.next();
        
        var currentDot = $('.active-dot');
        nextDot = currentDot.next();
        
        if (nextSlide.length === 0) {
            nextSlide = $('.slide').first();
            nextDot = $('.dot').first();
            }
        
        currentSlide.fadeOut(600).removeClass('active-slide');
        nextSlide.fadeIn(600).addClass('active-slide');
        
        currentDot.removeClass('active-dot');
        nextDot.addClass('active-dot');
    })
    
    
  $('.arrow-prev').click(function() {
    var currentSlide = $('.active-slide');
    var prevSlide = currentSlide.prev();
    
  var currentDot = $('.active-dot');
  var prevDot = currentDot.prev();

  if(prevSlide.length == 0) {
      prevSlide = $('.slide').last();
      prevDot = $('.dot').last();}

    currentSlide.fadeOut(600).removeClass('active-slide');
    prevSlide.fadeIn(600).addClass('active-slide');
    
  currentDot.removeClass('active-dot');
  prevDot.addClass('active-dot');
  });
  
      $('.next').click(function() {
        var currentSlide = $('.active-slide');
        var nextSlide = currentSlide.next();
        
        var currentDot = $('.active-dot');
        nextDot = currentDot.next();
        
        if (nextSlide.length === 0) {
            nextSlide = $('.slide').first();
            nextDot = $('.dot').first();
            }
        
        currentSlide.fadeOut(600).removeClass('active-slide');
        nextSlide.fadeIn(600).addClass('active-slide');
        
        currentDot.removeClass('active-dot');
        nextDot.addClass('active-dot');
    })
    
    
  $('.previous').click(function() {
    var currentSlide = $('.active-slide');
    var prevSlide = currentSlide.prev();
    
  var currentDot = $('.active-dot');
  var prevDot = currentDot.prev();

  if(prevSlide.length == 0) {
      prevSlide = $('.slide').last();
      prevDot = $('.dot').last();}

    currentSlide.fadeOut(600).removeClass('active-slide');
    prevSlide.fadeIn(600).addClass('active-slide');
    
  currentDot.removeClass('active-dot');
  prevDot.addClass('active-dot');
  });


}


$('.slider').hover(function() {
  $(this).find('.previous').css({ left: 0 }).stop(true, true).animate({ left: '10px', opacity: 1 });
  $(this).find('.next').css({ right: 0 }).stop(true, true).animate({ right: '10px', opacity: 1 });
}, function() {
  $(this).find('.previous').animate({ left: 0, opacity: 0 });
  $(this).find('.next').animate({ right: 0, opacity: 0 });
});

var sliding = function() {
    var currentSlide = $('.active-slide');
    var nextSlide = currentSlide.next();
        
    var currentDot = $('.active-dot');
    nextDot = currentDot.next();
        
    if (nextSlide.length === 0) {
        nextSlide = $('.slide').first();
        nextDot = $('.dot').first();
        }
        
    currentSlide.fadeOut(600).removeClass('active-slide');
    nextSlide.fadeIn(600).addClass('active-slide');
        
    currentDot.removeClass('active-dot');
    nextDot.addClass('active-dot');
}

$(document).ready(main);