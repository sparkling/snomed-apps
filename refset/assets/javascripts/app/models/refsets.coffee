Ember = require 'ember'
$     = require 'jquery'

Refsets = Ember.Object.extend
  loadRefsets: ->
    Ember.Deferred.promise (p) =>
      refsets = @get 'refsets'
      return p.resolve(refsets) if refsets?
      p.resolve $.getJSON('http://localhost:8080/refsets/api/refsets').then (res) =>
        refsets = res.map (i) -> Ember.Object.create i
        @set 'refsets', refsets
        refsets

  createRefset: (refset) ->
    console.log 'in create refset'
    console.log 'posting: ' + refset
    Ember.Deferred.promise (p) =>
      p.resolve($.ajax(        
        headers:
          Accept : "application/json; charset=utf-8",         
          "Content-Type": "application/json; charset=utf-8"   
        url: "http://localhost:8080/refsets/api/refsets"
        type: "POST"
        data: refset
        dataType: "json"
      ).then (response) =>
        console.log 'Response to update was [' + JSON.stringify response + ']'
        response
      )



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