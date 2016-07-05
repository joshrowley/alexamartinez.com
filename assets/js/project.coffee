$ ->
  if $('#project').length > 0
    $slideshow = $('#project .slideshow .img')

    if $slideshow.length > 0
      $slideshow.slick
        prevArrow: '<button type="button" class="slick-prev"></button>',
        nextArrow: '<button type="button" class="slick-next"></button'

    $('.video .wrap').fitVids()
