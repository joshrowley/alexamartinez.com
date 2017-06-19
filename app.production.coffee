_            = require 'lodash'
js_pipeline  = require 'js-pipeline'
app          = require './app'

# set up js / css pipeline for production
app.extensions = _.reject app.extensions, (e) -> e.name is 'JSPipeline' or e.name is 'CSSPipeline'
app.extensions.push(js_pipeline(files: 'assets/js/*.coffee', out: 'js/build.js', minify: true, hash: true))

# disable sourcemaps
app.stylus.sourcemap = false
app['coffee-script'].sourcemap = false

# disable jade pretty print
app.jade.pretty = false

module.exports = app
