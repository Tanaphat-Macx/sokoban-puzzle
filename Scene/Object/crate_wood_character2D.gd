extends CharacterBody2D

@onready var ray_cast_2d = $RayCast2D

var grid_size = 64
var direction = Vector2.ZERO
var inputs = {
	'ui_up' : Vector2.UP,
	'ui_down' : Vector2.DOWN,
	'ui_left' : Vector2.LEFT,
	'ui_right' : Vector2.RIGHT
}

#func _process(delta):
#	direction = Input.get_vector("left", "right", "up", "down").normalized()
#
#	# RayCast Direction update
#	ray_cast_2d.target_position = direction
#	ray_cast_2d.force_raycast_update()
#	if !ray_cast_2d.is_colliding():
#		position += direction
#		return true
#	return false

	
func move(dir):
	var  vector_pos = inputs[dir] * grid_size
	
	# RayCast Direction update
	ray_cast_2d.target_position = vector_pos
	ray_cast_2d.force_raycast_update()
	if !ray_cast_2d.is_colliding():
		position += vector_pos
		return true
	return false

	
	
