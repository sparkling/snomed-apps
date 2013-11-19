###
DS = require 'emberdata'

App.Plan = DS.Model.extend
  id                   : DS.attr(),
  rules                : DS.hasMany('rule'),
  terminal             : DS.belongsTo('rule')

###