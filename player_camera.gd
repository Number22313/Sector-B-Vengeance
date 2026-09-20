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
	if not shaking:
		shaking = true
		var shake_length = 0.2
		var start_position = self.position
		while shake_length > 0:
			var camera_offset = Vector3(randf_range(-0.05,0.05),randf_range(-0.05,0.05), 0.0)
			self.position = start_position + camera_offset
			
			shake_length -= get_process_delta_time()
			await get_tree().process_frame
		
		self.position = start_position
		shaking = false
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
