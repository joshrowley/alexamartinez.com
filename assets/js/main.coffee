$header = $('header')
klass   = 'open-menu'

$ ->
  $('.hamburger').on 'click', ->
    $header.addClass(klass)
    false

  $('body').on 'click', ->
    $header.removeClass(klass)
