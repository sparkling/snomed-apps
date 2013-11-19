###
DS = require 'emberdata'

App.Concept = DS.Model.extend
  id                   : DS.attr(),
  title                : DS.attr(),
  active               : DS.attr(),
  effectiveTime        : DS.attr()

###  