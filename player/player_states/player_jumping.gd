class_name PlayerJumping
extends PlayerState
## PlayerJumping
## 
## More docs later.


func enter():
	player.velocity.y = 20.0


func physics_update(delta):
	if not player.is_on_floor():
		Transitioned.emit(self,"PlayerFalling")
	else:
		Transitioned.emit(self,'PlayerIdle')
	player.move_and_slide()
