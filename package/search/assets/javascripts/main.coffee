$           = require 'jquery'
Ember       = require 'ember'
Templates   = require './templates'

require './app/helpers/date'
require './app/helpers/markdown'

App = Ember.Application.create()

# If you have many routes, you could move this to it's own module.
App.Router.reopen
  location: 'history'

App.Router.map ->
  @resource 'listing', path: '/'
  @resource 'issue', path: '/:number'

App.ListingRoute = require './app/routes/listing_route'
App.IssueRoute   = require './app/routes/issue_route'

App
