###
App.ApplicationAdapter = DS.RESTAdapter.extend
  namespace: 'api'
  bulkCommit: false


App.Adapter.map 'App.Refset'
  plan:
    embedded: 'always'
  conceptDisplayName:
    key: 'conceptDisplayName'
  publicId: 
    key: 'publicId'

App.Adapter.map 'App.Plan'
  concept:
    embedded: 'always'

App.Adapter.map 'App.Concept'
  effectiveTime:
    key: 'effectiveTime'
###    