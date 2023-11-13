extends MarginContainer

var num_grids = 1 
var current_grid = 1 
var grid_width = 550

@onready var grid_box = $VBoxContainer/HBoxContainer/ClipControl/GridBox

func _ready():
	# Number all the level boxes and unlock them
	# Replace with your game's level/unlocks/etc.
	# You can also connect the "level_selected" signals here
	num_grids = grid_box.get_child_count()
	for grid in grid_box.get_children():
		for box in grid.get_children():
			var num = box.get_index() + 1 + 20 * grid.get_index()
			box.level_num = num
			box.locked = false




func _on_back_button_pressed():
	if current_grid > 1:
		current_grid -= 1
		var tween = create_tween().set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
		tween.tween_property(grid_box, "position:x", grid_box.position.x + grid_width, 0.5)
#		grid_box.rect_position.x += grid_width


func _on_next_button_pressed():
	if current_grid < num_grids:
		current_grid += 1
		var tween = create_tween().set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
		tween.tween_property(grid_box, "position:x", grid_box.position.x - grid_width, 0.5)
#		grid_box.rect_position.x -= grid_width
