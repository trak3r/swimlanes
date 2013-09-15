console.log "hello world"

class Pool extends Backbone.Model

class Lane extends Backbone.Model

class LaneCollection extends Backbone.Collection
  model: Lane

class Leg extends Backbone.Model

class LegCollection extends Backbone.Collection
  model: Leg

class PoolView extends Backbone.View

class LaneView extends Backbone.View

class LegView extends Backbone.View

$(document).ready ->
  lanes = new LaneCollection()

  for x in [0..4] by 1
    legs = new LegCollection()
    for y in [0..9] by 1
      leg = new Leg()
      legs.add leg
    lane = new Lane(collection: legs)
    lanes.add lane
    
  pool = new Pool(collection: lanes)

  new PoolView(model: pool).render()
