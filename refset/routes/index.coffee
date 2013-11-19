http = require 'http'

exports.index = (config) ->

  options =
    reload:    config.liveReload.enabled
    optimize:  config.isOptimize ? false
    cachebust: if process.env.NODE_ENV isnt "production" then "?b=#{(new Date()).getTime()}" else ''

  # In the event plain html pages are being used, need to
  # switch to different page for optimized view
  name = if config.isOptimize and config.server.views.html
    "index-optimize"
  else
    "layout"

  (req, res) -> res.render name, options

exports.refsets = ->
  refsets = null
  (req, res) ->

    console.log 'in exports.refsets'

    res.set 'Content-Type', 'application/json'

    return res.send(refsets) if refsets?

    url = 'http://localhost:8080/refsets/api/refsets'
    http.get url, (refsetsRes) ->
      body = ''
      refsetsRes.on 'data', (d) ->
        body += d
      refsetsRes.on 'end', ->
        refsets = body
        res.send refsets

exports.refsetsPost = ->
  result = null
  (oreq, ores) ->
    ores.set 'Content-Type', 'application/json'
    
    options =
      host: 'localhost'
      port: '8080'
      path: '/api/refsets/post'
      method: 'POST'
      headers: oreq.headers

    console.log 'options: ' + JSON.stringify options

    req = http.request options, (res) ->
      console.log 'requesting'
      body = ''
      res.on 'data', (d) ->
        body += d
      res.on 'end', ->
        result = body
        ores.send result
        
    req.on 'error', (e) ->
      console.log 'error: ' + e.message

    req.end
    req

###
    http.request options, (refsetsRes) ->
      body = ''
      refsetsRes.on 'data', (d) ->
        body += d
      refsetsRes.on 'end', ->
        result = body
        res.send result
###

exports.refset = ->
  refset = null
  (req, res) ->
    res.set 'Content-Type', 'application/json'

    return res.send(refset) if refset?
    
    url = 'http://localhost:8080/refsets/api/refsets/' + req.params.publicId
    http.get url, (refsetRes) ->
      body = ''
      refsetRes.on 'data', (d) ->
        body += d
      refsetRes.on 'end', ->
        refset = body
        res.send refset
