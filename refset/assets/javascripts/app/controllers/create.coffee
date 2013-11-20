Ember = require 'ember'
Refsets = require '../models/refsets'


module.exports  = Ember.ObjectController.extend(
  error: 'none'
  actions:  
    save: ->
      console.log 'handling save'
      #console.log 'model: ' + JSON.stringify(@get('controller.model'))
      console.log 'model: ' + @get('model')

      @set('error', Refsets.createRefset(@get('model')))

      #@transitionTo('refsets')
)
