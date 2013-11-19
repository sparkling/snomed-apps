Ember = require 'ember'
Refsets = require '../models/refsets'

module.exports = Ember.Route.extend
  model: -> Refsets.loadRefsets()

#  model: -> @store.find 'refset'  