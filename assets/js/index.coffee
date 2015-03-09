$ ->
  if $('#index').length is not 0
    $('#skills-link').on 'click', (e) ->
      e.preventDefault()
      target  = @hash
      $target = $(@hash)

      $('html, body').stop().animate
        scrollTop: $target.offset().top
      , 900, 'swing', ->
        window.location.hash = target

    $('.hover').waypoint ->
      $(@).removeClass('preload')
    , offset: '75%'
