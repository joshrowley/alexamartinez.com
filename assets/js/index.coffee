$ ->
  $('#skills-link').on 'click', (e) ->
    e.preventDefault()
    target  = @hash
    $target = $(@hash)

    $('html, body').stop().animate
      scrollTop: $target.offset().top
    , 900, 'swing', ->
      window.location.hash = target
