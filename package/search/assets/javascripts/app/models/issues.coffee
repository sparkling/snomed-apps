Ember = require 'ember'
$     = require 'jquery'

Issues = Ember.Object.extend
  loadIssues: ->
    Ember.Deferred.promise (p) =>
      issues = @get 'issues'
      return p.resolve(issues) if issues?
      
      p.resolve $.getJSON('/issues').then (res) =>
        issues = res.map (i) -> Ember.Object.create i
        @set 'issues', issues
        issues

module.exports = Issues.create()