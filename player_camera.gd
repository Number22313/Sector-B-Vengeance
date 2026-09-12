extends Camera3D

@onready var player = $".."

var sensitivity = 0.2
var initial_rotation: Vector3 = rotation
var shaking: bool = false

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _unhandled_input(event: InputEvent) -> void:
		if event.is_action_pressed("ui_cancel"):
			if Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
				Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
		
		if event.is_action_pressed("ui_accept"):
			if Input.mouse_mode == Input.MOUSE_MODE_VISIBLE:
				Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
		
		if event is InputEventMouseMotion and Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
			player.rotate_y(deg_to_rad(-event.relative.x * sensitivity))
			rotate_x(deg_to_rad(-event.relative.y * sensitivity))
			rotation.x = clamp(rotation.x, deg_to_rad(-90), deg_to_rad(90))
			
		if event.is_action_pressed("ui_up"):
			door_shake()

func door_shake():
	shaking = true
	var duration: float = 0.5
	
	while duration > 0:
		var camera_shake_offset_x = randf_range(-0.03,0.03)
		var camera_shake_offset_y = randf_range(-0.03,0.03)
		
		rotation.x = initial_rotation.x + camera_shake_offset_x
		rotation.y = initial_rotation.y + camera_shake_offset_y
		
		duration -= get_process_delta_time()
		await get_tree().process_frame

	rotation = initial_rotation
	shaking = false
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
