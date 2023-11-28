extends Control

@export var game_manager : GameManager

func _ready():
	hide()
	game_manager.connect("toggle_game_paused", _on_game_manager_toggle_game_paused)

func _on_game_manager_toggle_game_paused(is_paused : bool):
	if(is_paused):
		show()
	else:
		hide()

func _on_puzzle_button_pressed():
	game_manager.game_paused = false		
	get_tree().change_scene_to_file("res://Scene/UI/level_menu.tscn")

func _on_audio_button_pressed():
	pass # Replace with function body.

func _on_resume_button_pressed():
#	resume_game.emit()
	game_manager.game_paused = false


