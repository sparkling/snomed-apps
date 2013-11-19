

###
App.Router.map ->
  @resource 'refsets', path: '/', ->
    @resource 'refset', path: '/:publicId', ->
      @route 'edit'
    @route 'create'

App.RefsetsRoute  = require './app/routes/refsets'
App.RefsetRoute   = require './app/routes/refset'
###