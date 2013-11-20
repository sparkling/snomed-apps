Ember = require 'ember'
$     = require 'jquery'

toEmberObject = (plainObject) ->
  
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

Refsets = Ember.Object.extend
  loadRefsets: ->
    Ember.Deferred.promise (p) =>
      refsets = @get 'refsets'
      return p.resolve(refsets) if refsets?
      p.resolve $.getJSON('http://localhost:8080/refsets/api/refsets').then (res) =>
        res.map (i) -> Ember.Object.create i
 
  createRefset: (refset) ->
    console.log 'POSTing: ' + JSON.stringify refset
    result = Ember.Object.create({})
    Ember.Deferred.promise (p) =>
      p.resolve $.ajax(        
        headers:
          Accept : "application/json; charset=utf-8",         
          "Content-Type": "application/json; charset=utf-8"   
        url: "http://localhost:8080/refsets/api/refsets"
        type: "POST"
        data: JSON.stringify refset
        dataType: "json" 
      ).then ((success) ->
        console.log('success: ' + JSON.stringify(success))
        result.setProperties(success)
      ), (error) ->
        console.log('fail: ' + JSON.stringify(error))
        console.log('response: ' + error.responseText)
        console.log('status: ' + error.responseText.status)
        #result.set('status', error.responseText.get('status')) 
        xyz = JSON.parse(error.responseText)
        console.log 'xyz: ' + xyz
        console.log 'xyz.status: ' + xyz.status
        result.set('wrapper', xyz)
        #result.set('wrapper', toEmberObject(error))
        #console.log 'PARSED! ' + JSON.stringify error
    result
 
###
mber.Deferred.promise(function(p) {
          p.resolve(
            $.ajax({
              headers: {          
                 Accept : "application/json; charset=utf-8",         
                "Content-Type": "application/json; charset=utf-8"   
              },
              url: "put",
              type: "POST",
              data: JSON.stringify(_this.get('controller.model')),
              dataType: "json"
            })
            .then(function(response) {
              console.log('Response to update was [' + JSON.stringify(response) + ']');
              var emberResponse =  MyApp.toEmberObject(response);
              if (response.success){
                _this.set('controller.model', emberResponse.refset);
              }
              _this.controllerFor('updateResponse').set('model', emberResponse);
            }) //then
          );//resolve
        });//deferred promise
###

module.exports = Refsets.create()