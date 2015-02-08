$ ->
  $slideshow = $('#project .inspiration .img')

  if $slideshow.length > 0
    $slideshow.slick
      autoplay: true
