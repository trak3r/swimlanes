class Leg extends Backbone.Model

class LegCollection extends Backbone.Collection
  model: Leg

class Lane extends Backbone.Model

class LaneCollection extends Backbone.Collection
  model: Lane

class Pool extends Backbone.Model

class LegView extends Backbone.Marionette.ItemView
  template: "#leg-template"

  render: ->
    super
    console.log "LegView.render"
    @

class LegsView extends Backbone.Marionette.CollectionView
  itemView: LegView

  render: ->
    super
    console.log "LegsView.render"
    @

class LaneView extends Backbone.Marionette.ItemView
  template: "#lane-template"

  render: ->
    super
    console.log "LaneView.render"
    new LegsView(
      el: @$el.find(".legs")
      collection: @model.get("collection")
      ).render()
    @

class LanesView extends Backbone.Marionette.CollectionView
  itemView: LaneView

  el: "#lanes"

  render: ->
    super
    console.log "LanesView.render"
    @

$(document).ready ->
  lanes = new LaneCollection()

  for x in [0..3] by 1
    legs = new LegCollection()
    for y in [0..7] by 1
      leg = new Leg()
      legs.add leg
    lane = new Lane(collection: legs)
    lanes.add lane
    
  new LanesView(collection: lanes).render()
