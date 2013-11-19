Ember = require 'ember'
$     = require 'jquery'

Refset = Ember.Object.extend
  loadRefset: (publicId) ->
    Ember.Deferred.promise (p) =>
      refset = @get 'refset'
      return p.resolve(refset) if refset?
      p.resolve $.getJSON('http://localhost:8080/refsets/api/refsets/' + publicId).then (res) =>
        refset = Ember.Object.create res
        console.log "res: " + res
        @set 'refset', refset
        refset

module.exports = Refset.create


###
DS = require 'emberdata'

App.Refset = DS.Model.extend
  id                   : DS.attr(),
  publicId             : DS.attr(),
  title                : DS.attr(),
  description          : DS.attr(),
  concept              : DS.attr(),
  conceptDisplayName   : DS.attr(),
  plan                 : DS.belongsTo('plan')
###








