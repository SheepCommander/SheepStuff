class_name PlayerWallhang
extends PlayerState
## Player Wallhang... is this uhh 
## 
## More docs later.

@export var wall_jump_force : float = 50.0

var jump_direction : Vector3
var wormal : Vector3 ## What the fuck is a WORMAL
var gravity_amount = 0.2
var wall_coyote = 0.2


func enter():
	wall_coyote = 0.2
	wormal = player.get_wall_normal()


func physics_update(delta):
	if Input.is_action_just_pressed('Jump'):
		jump_direction = wormal
		var player_direction = player.global_transform.basis * Vector3(0,0,-1) # TODO: What was this for?
		player.velocity.x += (jump_direction.x * wall_jump_force * 0.5) + (direction.x * wall_jump_force)
		player.velocity.z += (jump_direction.z * wall_jump_force * 0.5) + (direction.z * wall_jump_force)
		Transitioned.emit(self,'PlayerJumping')
	if player.get_slide_collision_count() >= 0.0:
		wall_coyote = 0.2
	wall_coyote -= delta
	
	if player.get_slide_collision_count() >= 0 or wall_coyote >= 0.0:
		player.velocity.x = lerp(player.velocity.x,0.0,3*delta)
		player.velocity.y = lerp(player.velocity.y,-15.0,1*delta)
		player.velocity.z = lerp(player.velocity.z,0.0,3*delta)
	
	# 
	player.move_and_slide()
	if player.get_slide_collision_count() <= 0 and wall_coyote <= 0.0:
		Transitioned.emit(self,'PlayerIdle')
	if player.is_on_floor():
		Transitioned.emit(self,'PlayerIdle')
	elif not player.is_on_floor() and not player.is_on_wall_only():
		Transitioned.emit(self,'PlayerFalling')
