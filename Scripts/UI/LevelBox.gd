@tool
extends PanelContainer

signal level_selected

@export var locked  = true:
	set = set_locked
@export var level_num : int = 1:
	set = set_level
	
@onready var level_number_lebel = $Level_number_lebel
@onready var lock_icon = $MarginContainer/Lock_icon


func set_locked(value):
	locked = value
	if not is_inside_tree():
		await  ready
	lock_icon.visible = value
	level_number_lebel.visible = not value
	
func set_level(value):
	level_num = value 
	if not is_inside_tree():
		await  ready
	level_number_lebel.text = str(level_num)
	
	
	
	
func _on_gui_input(event):
	if locked:
		return
	if event is InputEventMouseButton and event.pressed:
		level_selected.emit(level_num)
		print("Click level", level_num)
