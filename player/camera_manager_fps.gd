extends Node3D
## First-Person Player Camera Manager
## 
## More docs later.

@onready var camera: Camera3D = %Camera3D

var base_camera_position : Vector3
var camera_lerp_position : Vector3

var base_camera_rotation : Vector3
var camera_lerp_rotation : Vector3

var walking := false
var input_dir := Vector2()


func _ready() -> void:
	base_camera_position = camera.position
	base_camera_rotation = camera.rotation


func _process(delta: float) -> void:
	camera.position = lerp(camera.position,camera_lerp_position,5 * delta)
	camera.rotation = lerp(camera.rotation,camera_lerp_rotation,5 * delta)

	input_dir = Input.get_vector("Left",'Right','Forward','Backward')

	if walking:
		camera_lerp_rotation = base_camera_rotation - Vector3(deg_to_rad(4) * input_dir.y,0,deg_to_rad(4) * input_dir.x)


func _on_player_state_machine_new_state_transitioned(state) -> void:
	walking = false
	match state.name:
		'PlayerSliding':
			camera_lerp_rotation = base_camera_rotation - Vector3(deg_to_rad(8) * input_dir.y,0,deg_to_rad(8) * input_dir.x)
			camera_lerp_position = base_camera_position - Vector3(0,0.5,0)
		'PlayerFalling':
			camera_lerp_rotation = base_camera_rotation - Vector3(deg_to_rad(-15),0,0)
		'PlayerSlamming':
			camera_lerp_rotation = base_camera_rotation - Vector3(deg_to_rad(25),0,0)
		'PlayerWalking':
			walking = true
			camera_lerp_position = base_camera_position
			camera_lerp_rotation = base_camera_rotation
		_:
			camera_lerp_position = base_camera_position
			camera_lerp_rotation = base_camera_rotation
