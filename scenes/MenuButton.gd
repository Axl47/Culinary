extends TextureButton
@onready var button = $CollisionShape2D

func _on_pressed():
	get_tree().change_scene_to_file("res://scenes/level_1.tscn")
