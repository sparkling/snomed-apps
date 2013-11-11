Ember = require 'ember'
Handlebars = require 'handlebars'
marked = require 'marked'

marked.setOptions sanitize: true

module.exports = Ember.Handlebars.registerBoundHelper 'markdown', (text) ->
    new Handlebars.SafeString marked text