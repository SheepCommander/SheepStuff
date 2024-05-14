class_name PlayerSliding
extends PlayerState
## PlayerSliding.
## 
## More docs later.

var slide_timer : float = 0.0
var slide_direction : Vector3


func enter():
	if direction:
		slide_direction = direction
	else:
		slide_direction = player.global_transform.basis * Vector3(0,0,-1)


func physics_update(delta):
	player.velocity.x = slide_direction.x * 50 * (slide_timer + 0.51)
	player.velocity.z = slide_direction.z * 50 * (slide_timer + 0.51)
	player_gravity(delta * 2)
	player.move_and_slide()
	if Input.is_action_just_released('Slide') or slide_direction != slide_direction:
		Transitioned.emit(self,'PlayerIdle')
	elif Input.is_action_just_pressed('Jump'):
		player.velocity.x += slide_direction.x * 50
		player.velocity.z += slide_direction.z * 50
		Transitioned.emit(self,'PlayerJumping')
	elif not player.is_on_floor():
		Transitioned.emit(self,'PlayerFalling')


func exit():
	if !input_dir:
		player.velocity.x = 0.0
		player.velocity.z = 0.0
