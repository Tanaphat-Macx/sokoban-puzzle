extends Area2D

const length = 1
var tile_size = 64
@onready var ray = $RayCast2D

var inputs = {
	"right" : Vector2.RIGHT,
	"left" : Vector2.LEFT,
	"up" : Vector2.UP,
	"down" : Vector2.DOWN
}

func _unhandled_input(event):
	for dir in inputs.keys():
		if event.is_action_pressed(dir):
			move(dir)
			update_animation(dir)
	
func move(dir):
	ray.target_position.y
	ray.target_position = inputs[dir] * tile_size 
	ray.force_raycast_update()
	if !ray.is_colliding():
		position += inputs[dir] * tile_size
	else:
		var collider = ray.get_collider()
		if collider.is_in_group("box"):
			if collider.move(dir):
				position += inputs[dir] * tile_size

	
func update_animation(dir):
	if Input.is_action_pressed("left"):
		$AnimationPlayer.play("walk_left")
	elif Input.is_action_pressed("right"):
		$AnimationPlayer.play("walk_right")
	elif Input.is_action_pressed("up"):
		$AnimationPlayer.play("walk_up")
	elif Input.is_action_pressed("down"):
		$AnimationPlayer.play("walk_down")
	



#------------------------------------ Vector Movement ---------------------------------------------

#@export var speed : float = 300.0
#@export var push_force : float = 80.0
#@onready var animation_tree : AnimationTree = $AnimationTree
#
#
#
#var direction = Vector2.ZERO
#@onready var ray_cast_2d = $RayCast2D
#
#func _ready():
#	animation_tree.active = true
#
#func _process(delta): # update animation in delta time
#	update_animation()
#
#func _physics_process(delta):
#
#	direction = Input.get_vector("left", "right", "up", "down").normalized()
#	if direction:
#		velocity = direction * speed
#	else:
#		velocity = Vector2.ZERO
#
#	# Push object <Rigibody2D>
#	for i in get_slide_collision_count():
#		var collision = get_slide_collision(i)
#		if collision.get_collider() is RigidBody2D:
#			collision.get_collider().apply_central_impulse(-collision.get_normal() * push_force)
#
#	# RayCast Direction update
#	ray_cast_2d.target_position = direction
#	ray_cast_2d.force_raycast_update()
#	if !ray_cast_2d.is_colliding():
#		position += direction
#
#	move_and_slide() 
#
#func update_animation():
#	if(velocity == Vector2.ZERO):
#		animation_tree["parameters/conditions/idle"] = true
#		animation_tree["parameters/conditions/is_moving"] = false
#	else:
#		animation_tree["parameters/conditions/idle"] = false
#		animation_tree["parameters/conditions/is_moving"] = true
#
#	if(direction != Vector2.ZERO):
#		animation_tree["parameters/idle/blend_position"] = direction
#		animation_tree["parameters/walk/blend_position"] = direction
	
