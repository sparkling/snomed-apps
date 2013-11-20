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


App.toEmberObject = (plainObject) ->
  
  # Return undefined or null
  return plainObject  unless plainObject
  
  # Build plain JS object with Ember Objects/Arrays/primitives
  data = {}
  for key of plainObject
    value = plainObject[key]
    type = Ember.typeOf(value)
    if type is "array"
      emberArray = Ember.A()
      
      #{
      #  replace: function (idx, amt, objects){
      #    console.log('IN REPLACE!!!')
      #    this.enumerableContentDidChange()
      #  }
      #});
      i = 0

      while i < value.length
        emberArray.pushObject MyApp.toEmberObject(value[i])
        ++i
      data[key] = emberArray
    else if type is "object"
      data[key] = MyApp.toEmberObject(value)
    else data[key] = value  if type is "string" or type is "number" or type is "boolean"
  result = Ember.Object.create(data)
  result

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






