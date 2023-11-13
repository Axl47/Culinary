extends Node2D

@export var speed: float = 2.0
@export var speed_scale: float = 1.0

@onready var animation = $AnimationPlayer
@onready var sink = $"../BG/Sink"
@onready var sink_flood = $"../BG/Sink_Flood"
@onready var chorro = $"../Water/Chorro"

var playerInside: bool = false
var knifeFell := false


func _process(delta):
	if Input.is_action_just_pressed("use") and playerInside and not animation.current_animation == "rotation" and knifeFell:
		animation.play("fiufiu")
		animation.speed_scale = speed
		flood_level()

func _on_area_2d_body_entered(body):
	if body.name == "Mate":
		playerInside = true


func _on_area_2d_body_exited(body):
	if body.name == "Mate":
		playerInside = false

func flood_level():
	sink.visible = false
	sink_flood.visible = true
	chorro.disabled = false


func _on_knife_trigger_body_entered(body):
	knifeFell = true
