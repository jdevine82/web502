var numberofbooks = 1;
$(document).ready(function() {
    enquire.register("screen and (max-width: 600px)", {
        match :function() {
            numberofbooks = 1;
            
          
        },
        unmatch : function() {
            numberofbooks = 3; 
            
        }
    });
    
});

    $(function() {
      $('.datepicker').datepicker( { dateFormat:'dd-mm-yy' } );
    });
 
 $(document).ready(function () {
    //initialize swiper when document ready
  var swiper = new Swiper('.s1', {
      effect: 'coverflow',
      grabCursor: true,
      centeredSlides: true,
      slidesPerView: 'auto',
      coverflowEffect: {
        rotate: 50,
        stretch: 0,
        depth: 100,
        modifier: 1,
        slideShadows : true,
          },
      
      autoplay: {
    delay: 3000,
   },
   navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
      },
    });
});

$(document).ready(function () {
    
    //initialize swiper when document ready
  var swiper2 = new Swiper('.s2', {
    slidesPerView: numberofbooks,
      spaceBetween: 30,
       autoplay: {
    delay: 5000,
   },
    });
  });
 
 
 $(document).ready(function () {
    //initialize swiper when document ready
  var swiper3= new Swiper('.s3', {
    slidesPerView: numberofbooks,
      spaceBetween: 30,
       autoplay: {
    delay: 10000,
   },
    });
  });
 