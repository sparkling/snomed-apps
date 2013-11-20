#"lint"
exports.config =
  modules: ["server","browserify","live-reload","bower","minify"] 
  template:
    wrapType: 'common'
    commonLibPath: 'ember'
    handlebars: ember: enabled: true
  browserify:
    bundles:
      [
        entries: ['javascripts/main.js']
        outputFile: 'bundle.js'
      ]
    shims:
      jquery:
        path: 'javascripts/vendor/jquery/jquery'
        exports: '$'
      handlebars:
        path: 'javascripts/vendor/ember/handlebars'
        exports: 'Handlebars'
      ember:
        path: 'javascripts/vendor/ember/ember'
        exports: 'Ember'
        depends:
          handlebars: 'Handlebars'
          jquery: '$'
      emberdata:
        path: 'javascripts/vendor/ember/ember-data'
        exports: 'DS'
        depends:
          jquery: '$'
      emberconsoleutil:
        path: 'javascripts/vendor/ember/ember-console-utils'
        exports: 'console'
      bootstrap: 
        path: 'javascripts/vendor/bootstrap/bootstrap'
        exports: 'Bootstrap'
    aliases:
      bootstrap: 'javascripts/vendor/bootstrap/bootstrap'
      moment:    'javascripts/vendor/momentjs/moment'
      lodash:    'javascripts/vendor/lodash'
      marked:    'javascripts/vendor/marked/marked'
    noParse:
      [
        'javascripts/vendor/bootstrap/bootstrap'
        'javascripts/vendor/jquery/jquery'
        'javascripts/vendor/ember/handlebars'
        'javascripts/vendor/ember/ember'
        'javascripts/vendor/ember/ember-data'
      ]