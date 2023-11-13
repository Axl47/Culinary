extends Node2D
@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var fridge = $AnimatedSprite2D/Fridge


func _on_animated_sprite_2d_animation_finished():
	if animated_sprite_2d.animation == "start":
				get_tree().change_scene_to_file("res://scenes/level_1.tscn")

func _unhandled_key_input(event):
	if event is InputEventKey and event.pressed:
		animated_sprite_2d.animation = "start"
	animated_sprite_2d.play()
	fridge.play()
