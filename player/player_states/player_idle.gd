class_name PlayerIdle
extends PlayerState
## The Player's Idle state.
## 
## More docs later.


func enter():
	pass


func physics_update(delta : float):
	if player.is_on_floor():
		if player.velocity.length() != 0.0 or Input.get_vector("Left","Right","Forward","Backward").length() != 0.0:
			Transitioned.emit(self,'PlayerWalking')

		if Input.is_action_pressed('Jump'): # TODO: Add a CoyoteTimer for jumping
			Transitioned.emit(self,'PlayerJumping')

		if Input.is_action_just_pressed('Slide'):
			Transitioned.emit(self,'PlayerSliding')

	elif not player.is_on_floor():
		Transitioned.emit(self,'PlayerFalling')

	player.move_and_slide()


func exit():
	pass
