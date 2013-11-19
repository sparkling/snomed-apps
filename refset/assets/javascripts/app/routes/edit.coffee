Ember = require 'ember'
#RefsetCreateAndEditRoute = require '../routes/refset.create.and.edit'

#module.exports = RefsetCreateAndEditRoute.extend
module.exports = Ember.Route.extend
  model: ->
    @modelFor('refset')

  #actions:
  #  goBack: ->
  #    @transitionTo('refset')
