moment = require('moment')
Ember = require('ember')

module.exports = Ember.Handlebars.registerBoundHelper 'date', (date) ->
    moment(date).fromNow()