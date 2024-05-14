class_name PlayerFalling
extends PlayerState
## PlayerFalling
## 
## More docs later.


func physics_update(delta):
	if not player.is_on_floor() and not player.is_on_wall_only():
		player_gravity(delta)
		player_movement(2,2,delta)
		if Input.is_action_just_pressed('Slam'):
			Transitioned.emit(self,'PlayerSlamming')

	elif player.is_on_wall_only():
		Transitioned.emit(self,"PlayerWallhang")

	elif player.is_on_floor():
		Transitioned.emit(self,"PlayerIdle")

	player.move_and_slide()

