Ember = require 'ember'
Issues = require '../models/issues'

module.exports = Ember.Route.extend
  model: -> Issues.loadIssues()