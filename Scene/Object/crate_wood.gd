extends CharacterBody2D
class_name  crate_wood

var pushing : bool = false
var tween = Tween

func push(direction):
	if pushing:
		return
		
	pushing = true
	tween.interpolate_property(
		self, "position",
		position, position + direction * 64,
		0.5, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT		
	)
	tween.start()
	
