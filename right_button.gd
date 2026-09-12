extends StaticBody3D

@onready var Right_Door = $"../Right Door"
@onready var right_door_position: Vector3 = Right_Door.position

var open_door: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func interact():
	var right_door_tween = create_tween().set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)
	var right_door_slide: Vector3
	if not open_door:
		print("Right door open")
		right_door_slide = right_door_position + Vector3(0, 4, 0)
	else:
		print("Right door closed")
		right_door_slide = right_door_position
	
	right_door_tween.tween_property(Right_Door, "position", right_door_slide, 0.6)
	
	open_door = not open_door


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
