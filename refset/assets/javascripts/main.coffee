$           = require 'jquery'
Ember       = require 'ember'
Templates   = require './templates'

require './app/helpers/date'

App = Ember.Application.create
	LOG_TRANSITIONS: true,
  LOG_STACKTRACE_ON_DEPRECATION: true,
  LOG_BINDINGS: true,
  LOG_TRANSITIONS_INTERNAL: true,
  LOG_VIEW_LOOKUPS: true,
  LOG_ACTIVE_GENERATION: true

  #rootElement: '#app'

  ready: ->
    console.log 'App.ready()'

  lookupStore: ->
    @__container__.lookup 'store:main'

  lookupRouter: ->
    @__container__.lookup 'router:main'

  lookupController: (controllerName, options) ->
    @__container__.lookup 'controller:' + controllerName, options

  lookupContainer: ->
    @__container__

App.deferReadiness

# If you have many routes, you could move this to it's own module.
App.Router.reopen
  location: 'history'

App.Router.map ->
  @resource 'refsets', path: '/'
  @resource 'create', path: '/create'
  @resource 'refset', path: ':publicId', ->
    @route 'edit'
    


#App.RefsetController = require './app/controllers/refset'

#App.CreateAndEditRoute = require './app/routes/refset.create.and.edit'
#App.RefsetEditRoute = require './app/routes/refset.edit'


App.ApplicationRoute = require './app/routes/application'
App.RefsetsRoute  = require './app/routes/refsets'
App.RefsetsController  = require './app/controllers/refsets'


App.RefsetRoute   = require './app/routes/refset'
App.CreateRoute = require './app/routes/create'
App.CreateController = require './app/controllers/create'

App






