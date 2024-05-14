class_name PlayerWalking
extends PlayerState
## PlayerWalkingState.
## 
## More docs later.


func physics_update(delta):
	if player.is_on_floor():
		player_movement(8,6,delta)
		if Input.is_action_pressed('Jump'):
			Transitioned.emit(self,'PlayerJumping')
		if Input.is_action_pressed('Slide'):
			Transitioned.emit(self,'PlayerSliding')
		player.move_and_slide()

	if player.velocity.length() == 0.0:
		Transitioned.emit(self,'PlayerIdle')

	elif not player.is_on_floor():
		Transitioned.emit(self,'PlayerFalling')
