extends Path2D

@export var loop: bool = true
@export var speed: float = 2.0
@export var speed_scale: float = 1.0

@onready var path = $PathFollow2D
@onready var animation = $AnimationPlayer

func Fall():
	animation.play("fall")
	animation.speed_scale = speed

