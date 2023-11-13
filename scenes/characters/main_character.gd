extends CharacterBody2D


@export var speed : float = 2000.0
@export var jump_velocity : float = -3000.0

@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var knife = $"../Knife"

var onWater := false

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	if not velocity.x == 0:
		animated_sprite_2d.animation = "rolling"
	else:
		animated_sprite_2d.animation = "idle"		
	
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta * 2
		animated_sprite_2d.animation = "rolling"

	# Handle Jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_velocity

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("left", "right")
	if direction:

		velocity.x = direction * speed
		rotation += (direction / 10 - 0.005)
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		if is_on_floor():
			rotation = 0
	
	if onWater:
		velocity.y = jump_velocity

	move_and_slide()
	
	var isLeft = velocity.x < 0
	animated_sprite_2d.flip_h = isLeft


func _on_area_2d_body_entered(body):
	if body.name == "Mate":
		get_tree().change_scene_to_file("res://scenes/game_over.tscn")


func _on_water_body_entered(body):
	if body.name == "Mate":
		onWater = true


func _on_water_body_exited(body):
	if body.name == "Mate":
		onWater = false


func _on_win_body_entered(body):
	if body.name == "Mate":
		get_tree().change_scene_to_file("res://scenes/win.tscn")

