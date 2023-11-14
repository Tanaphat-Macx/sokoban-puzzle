extends Control

@onready var label = $Label
@onready var level_menu = $LevelMenu
@onready var player_face = $PlayerFace
@onready var v_box_container = $VBoxContainer

func _on_puzzles_pressed():
	$Anim.play("on_puzzles_pressed")

func _on_home_button_pressed():
	$Anim.play_backwards("on_puzzles_pressed")

func _on_anim_animation_finished(anim_name):
	if anim_name == "Reveal":
		$Cover.visible = false
		


