extends Camera3D

@onready var animatronic_camera_link: Camera3D
@onready var label = $Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var camera = get_tree().get_nodes_in_group("Animatronic Cameras")
	animatronic_camera_link = camera[0]
	label.text = "Bonnie"

func _input(event: InputEvent) -> void:
	var camera = get_tree().get_nodes_in_group("Animatronic Cameras")
	if event.is_action_pressed("1"):
		animatronic_camera_link = camera[0]
		label.text = "Bonnie"
	
	if event.is_action_pressed("2"):
		animatronic_camera_link = camera[1]
		label.text = "Freddy"
	
	if event.is_action_pressed("3"):
		animatronic_camera_link = camera[2]
		label.text = "Foxy"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if animatronic_camera_link:
		self.global_transform = animatronic_camera_link.global_transform
