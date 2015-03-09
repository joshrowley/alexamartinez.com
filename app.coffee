axis            = require 'axis'
rupture         = require 'rupture'
autoprefixer    = require 'autoprefixer-stylus'
js_pipeline     = require 'js-pipeline'
css_pipeline    = require 'css-pipeline'
dynamic_content = require 'dynamic-content'
yaml            = require 'roots-yaml'
marked          = require 'marked'
_               = require 'lodash'

project_url = (name) -> "/projects/#{name}.html"

is_first_project = (project, order) ->
  project._url == project_url(order[0])

is_last_project = (project, order) ->
  project._url == project_url(order[order.length - 1])

module.exports =
  ignores: [
    'readme.md', '**/layout.*', '**/_*', '.gitignore', 'ship.*conf',
    '**/.DS_Store', 'Makefile'
    ]

  extensions: [
    yaml()
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
    email: 'alexamartinez.design@gmail.com'
    marked: marked
    slick_css: '//cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.4.0/slick.min.css'
    slick_js: '//cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.4.0/slick.min.js'
    fit_vids_js: '//cdnjs.cloudflare.com/ajax/libs/fitvids/1.1.0/jquery.fitvids.min.js'
    slick_theme: '//cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.4.0/slick-theme.min.css'
    jquery: '//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'
    waypoints_js: '//cdnjs.cloudflare.com/ajax/libs/waypoints/2.0.5/waypoints.min.js'
    project_img: (p) -> "/img/projects/#{p}"
    bg_img: (p, color) ->
      style = "background-image: url('#{p}');"
      if color then style += "background-color: #{color};"
      return style
    bg_color: (color = '#fff') ->
      if color == 'dark' then color = '#f5f5f5'
      "background-color: #{color};"
    sort_projects: (projects, order) ->
      _.map order, (k) ->
        _.find(projects, (p) -> p._url == "/projects/#{k}.html")
    prev_project_url: (project, order) ->
      if is_first_project(project, order) 
        return project_url(order[order.length - 1])
      i = _.findIndex(order, (p) -> project._url == "/projects/#{p}.html")
      project_url(order[i - 1])
    next_project_url: (project, order) ->
      if is_last_project(project, order)  then return project_url(order[0])
      i = _.findIndex(order, (p) -> project._url == "/projects/#{p}.html")
      project_url(order[i + 1])


  server:
    clean_urls: true
