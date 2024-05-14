extends CharacterBody3D
## Player
## 
## More docs later.

@export_range(0.01,0.5) var mouse_sensivitvity : float = 0.10

@onready var camera_rotation: Node3D = %CameraRotation


func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED


func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		rotate_y(deg_to_rad(-event.relative.x * mouse_sensivitvity))
		camera_rotation.rotate_x(deg_to_rad(-event.relative.y * mouse_sensivitvity))
		camera_rotation.rotation.x = clamp(camera_rotation.rotation.x, deg_to_rad(-89.9), deg_to_rad(89.9))
	
	if event.is_action_pressed('Restart'):
		global_position = Vector3(0,1,0)

# TODO: Add a PlayerSprinting state
