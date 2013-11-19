Ember = require 'ember'

module.exports = Ember.Route.extend
  activate: ->
    @controllerFor('refset').setProperties
      'editMode': true
      'deleteMode': false

  deactivate: ->
    @controllerFor('refset').setProperties
      'editMode': true
      'deleteMode': false