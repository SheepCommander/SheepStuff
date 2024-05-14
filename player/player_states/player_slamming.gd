class_name PlayerSlamming
extends PlayerState
## PlayerSlamming.
## 
## More docs later.


func physics_update(delta):
	player_gravity(delta * 20)
	if player.is_on_floor():
		Transitioned.emit(self,'PlayerIdle')
	player.move_and_slide()
