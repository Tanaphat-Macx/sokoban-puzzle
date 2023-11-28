extends Node

class_name GameManager

@onready var pause_menu = $GUI/PauseMenu

# Problem here ! : It's work with one scene but another scene can't paused
signal toggle_game_paused(is_paused : bool)


var game_paused : bool = false:
	get:
		return game_paused
	set(value):
		game_paused = value
		get_tree().paused = game_paused
		emit_signal("toggle_game_paused", game_paused)
		

func _on_pause_button_pressed():
	game_paused = !game_paused
