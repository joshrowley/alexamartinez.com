$ ->
  $header = $('header')
  klass   = 'open-menu'

  $('.hamburger').on 'click touchstart', ->
    $header.addClass(klass)
    false

  $('body').on 'click touchstart', ->
    $header.removeClass(klass)
