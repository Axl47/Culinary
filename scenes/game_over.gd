extends Node2D

func _on_return_pressed():
	get_tree().change_scene_to_file("res://scenes/intro.tscn")


func _on_retry_pressed():
	get_tree().change_scene_to_file("res://scenes/level_1.tscn")
