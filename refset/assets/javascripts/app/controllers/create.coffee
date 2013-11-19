Ember = require 'ember'
Refsets = require '../models/refsets'


module.exports  = Ember.ObjectController.extend(
  actions: 
    save: ->
      console.log 'handling save'
      console.log 'title: ' + @get 'title'
      console.log 'desc: ' + @get 'description'
      Refsets.createRefset(@get 'model')
      #console.log 'result is: ' + JSON.stringify result
      #@transitionTo('refsets')
)
