Ember = require 'ember'
Refset = require '../models/refset'

module.exports = Ember.Route.extend
  model: (args) -> Refset.loadRefset(args.publicId)

#model: (params) -> @store.find 'refset', params.publicId  