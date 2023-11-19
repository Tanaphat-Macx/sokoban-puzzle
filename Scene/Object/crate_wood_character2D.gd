extends CharacterBody2D

@onready var ray = $RayCast2D

var moving = false
var tile_size = 64
var animation_speed = 1

var inputs = {
	"right" : Vector2.RIGHT,
	"left" : Vector2.LEFT,
	"up" : Vector2.UP,
	"down" : Vector2.DOWN
}

func move(dir):
	ray.target_position = inputs[dir] * tile_size
	ray.force_raycast_update()
	if !ray.is_colliding():
		position += inputs[dir] * tile_size
		return true
	return false

