extends Sprite2D


func _on_area_2d_body_entered(body):
	get_parent().remove_child(self)
