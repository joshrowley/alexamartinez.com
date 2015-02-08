axis            = require 'axis'
rupture         = require 'rupture'
autoprefixer    = require 'autoprefixer-stylus'
js_pipeline     = require 'js-pipeline'
css_pipeline    = require 'css-pipeline'
dynamic_content = require 'dynamic-content'
marked          = require 'marked'

module.exports =
  ignores: ['readme.md', '**/layout.*', '**/_*', '.gitignore', 'ship.*conf']

  extensions: [
    dynamic_content()
    js_pipeline(files: 'assets/js/*.coffee')
    css_pipeline(files: 'assets/css/*.styl')
  ]

  stylus:
    use: [axis(), rupture(), autoprefixer()]
    sourcemap: true

  'coffee-script':
    sourcemap: true

  jade:
    pretty: true

  locals:
    description: 'The design portfolio of Alexa Martinez.'
    author: 'Alexa Martinez, Josh Rowley'
    title: 'Alexa Martinez'
    email: 'arm5924@rit.edu'
    marked: marked
    slick_css: '//cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.4.0/slick.min.css'
    slick_js: '//cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.4.0/slick.min.js'
    slick_theme: '//cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.4.0/slick-theme.min.css'
    jquery: '//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'

  server:
    clean_urls: true
