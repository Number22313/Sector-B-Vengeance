extends RayCast3D

@onready var Raycast = $"."

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("interact"):
		if Raycast.is_colliding():
			var object = Raycast.get_collider()
			
			if object.has_method("interact"):
				object.interact()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
