Ember = require 'ember'
#RefsetCreateAndEditRoute = require '../routes/refset.create.and.edit'
Refset = require '../models/refset'

#module.exports = RefsetCreateAndEditRoute.extend
module.exports = Ember.Route.extend
  model: ->
    console.log 'creating model'
    Ember.Object.extend(
      title: ''
      description: ''
    ).create

