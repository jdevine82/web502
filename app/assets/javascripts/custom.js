

    $(function() {
      $('.datepicker').datepicker( { dateFormat:'dd-mm-yy' } );
    });
 
 $(document).ready(function () {
    //initialize swiper when document ready
  var swiper = new Swiper('.swiper-container', {
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
      pagination: {
        el: '.swiper-pagination',
         },
      autoplay: {
    delay: 5000,
   },
   navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
      },
    });
});