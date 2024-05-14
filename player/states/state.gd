class_name State
extends Node
## The base State class for StateManagers.
## 
## More docs later.

signal Transitioned # TODO: arent signals supposed to be lowercase?


# NOTE: Technically "virtual functions" (ones meant to be overriden)
# should begin with an underscore_ , but I'll ignore that for now.
func enter() -> void:
	pass


func exit() -> void:
	pass


func update(delta: float) -> void:
	pass


func physics_update(delta: float) -> void:
	pass
