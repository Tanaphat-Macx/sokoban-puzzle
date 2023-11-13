extends CharacterBody2D

@export var direction : Vector2 = Vector2.ZERO	
@export var speed : float = 150


func _process(delta):
	#	update_animation()
	direction = Vector2.ZERO
	if Input.is_action_pressed("left"):
		direction = Vector2.LEFT
		$AnimationPlayer.play("walk_left")
	elif Input.is_action_just_released("left"):
		$AnimationPlayer.play("idel_left")
		
	if Input.is_action_pressed("right"):
		direction = Vector2.RIGHT
		$AnimationPlayer.play("walk_right")
	elif Input.is_action_just_released("right"):
		$AnimationPlayer.play("idel_right")	
		
	if Input.is_action_pressed("up"):
		direction = Vector2.UP
		$AnimationPlayer.play("walk_up")
	elif Input.is_action_just_released("up"):
		$AnimationPlayer.play("idel_up")
		
	if Input.is_action_pressed("down"):
		direction = Vector2.DOWN
		$AnimationPlayer.play("walk_down")
	elif Input.is_action_just_released("down"):
		$AnimationPlayer.play("idel_down")

		
	var collision = move_and_collide(direction * speed * delta)
	if collision:
		var node = collision.get_collider()
		if node is CharacterBody2D:
			node.push(direction)
































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
	
