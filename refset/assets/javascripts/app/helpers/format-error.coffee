
Ember = require('ember')

module.exports = Ember.Handlebars.helper 'format-error', (errors) ->
  errors.join()