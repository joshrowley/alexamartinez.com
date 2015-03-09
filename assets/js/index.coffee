$ ->
  if $('#index').length > 0
    animate = (e) ->
      e.preventDefault()
      target  = @hash
      $target = $(@hash)

      $('html, body').stop().animate
        scrollTop: $target.offset().top
      , 900, 'swing', ->
        window.location.hash = target

    $('#skills-link').on('click', animate)
    $('#about-link').on('click', animate)

    $('.hover').waypoint ->
      $(@).removeClass('preload')
    , offset: '65%'
