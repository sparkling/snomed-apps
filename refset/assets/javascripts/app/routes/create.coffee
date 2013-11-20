Ember = require 'ember'
#RefsetCreateAndEditRoute = require '../routes/refset.create.and.edit'
Refset = require '../models/refset'

#module.exports = RefsetCreateAndEditRoute.extend
module.exports = Ember.Route.extend
  model: ->
      title: 'title'
      description: 'decs'

###
  setupController: (controller, model) ->
    controller.set 'model', model
###