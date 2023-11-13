extends StaticBody2D

var toggle: bool = false
@onready var estufa = $Estufa


func _on_timer_timeout():
	toggle = !toggle
	
	if toggle:
		estufa.animation = "on"
	else:
		estufa.animation = "off"


func _on_area_2d_body_entered(body):
	if body.name == "Mate" and toggle:
		get_tree().change_scene_to_file("res://scenes/game_over.tscn")
