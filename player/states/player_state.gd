extends State
class_name PlayerState
## PlayerState
## 
## More docs later.

@export var player : CharacterBody3D

var input_dir : Vector2
var direction : Vector3


func _process(delta: float) -> void:
	input_dir = Input.get_vector("Left", "Right", "Forward", "Backward")
	direction = (player.global_transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()


func player_movement(acceleration: float, deceleration: float, delta: float):
	if direction:
		player.velocity.x = lerp(player.velocity.x,direction.x * 15,acceleration * delta)
		player.velocity.z = lerp(player.velocity.z,direction.z * 15,acceleration * delta)
	else:
		player.velocity.x = lerp(player.velocity.x,0.0,deceleration * delta)
		player.velocity.z = lerp(player.velocity.z,0.0,deceleration * delta)


func player_gravity(delta):
	player.velocity.y -= 50 * delta
