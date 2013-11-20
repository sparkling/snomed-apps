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
        if Ember.typeOf(value[i]) == "string"
          emberArray.pushObject value[i] 
        else
          emberArray.pushObject toEmberObject(value[i])
        ++i

      data[key] = emberArray
    else if type is "object"
      data[key] = toEmberObject(value)
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
        result.setProperties(JSON.parse(success.responseText))
      ), (error) ->
        console.log('fail: ' + JSON.stringify(error))
        parsed = toEmberObject(JSON.parse(error.responseText))
        console.log 'after toEmber: ' + parsed
        console.log 'after toEmber: ' + JSON.stringify parsed

        #parsed = JSON.parse(error.responseText)
        #console.log('parsed: ' + JSON.stringify(parsed))
        #result.setProperties(parsed)
        #console.log 'RESULT: ' + JSON.stringify(result.get('fieldErrors.publicId'))
        #arr = Ember.A()
        #k = 0
        #while k < parsed.fieldErrors.length
        #  console.log 'PUSH!'
        #  arr.pushObject parsed.fieldErrors[k]
        #result.set('fieldErrors', arr)

        #result.setProperty('fieldErrors', 'errorshere')
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