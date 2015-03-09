$ ->
  if $('#project').length is not 0
    $slideshow = $('#project .slideshow .img')

    if $slideshow.length > 0
      $slideshow.slick()

    $('.video .wrap').fitVids()
