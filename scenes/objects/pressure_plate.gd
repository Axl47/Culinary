extends StaticBody2D
@onready var oven = $"../Oven/Estufa"
@onready var plate = $Plate

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	if body.name == "Mate":
		oven.animation = "off"
		plate.animation = "pressed"

