Ember = require 'ember'

module.exports = Ember.Route.extend
  actions: 
    showModal: (name) ->
      @controllerFor(name).set('modalVisible', true)
    goBack: ->
      @transitionTo('refsets')