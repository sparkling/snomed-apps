###

DS = require 'emberdata'

App.Rule = DS.Model.extend
  id                   : DS.attr(),
  plan                 : DS.belongsTo('plan'),
  type                 : DS.attr(),
  left                 : DS.belongsTo('rule'),
  right                : DS.belongsTo('rule'),
  concepts             : DS.hasMany('concept')

###