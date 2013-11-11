Ember = require 'ember'
Issues = require '../models/issues'

module.exports = Ember.Route.extend
  model: (args) ->
    Issues.loadIssues().then (i) ->
      i.findBy "number", Number(args.number)