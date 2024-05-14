class_name StateMachine
extends Node
## StateMachine
##
## More docs later.

signal NewStateTransitioned(state)

@export var initial_state : State

var current_state : State
var states : Dictionary = {}

@export var player : CharacterBody3D


func _ready() -> void:
	for child_state in get_children():
		if child_state is State:
			states[child_state.name.to_lower()] = child_state
			child_state.Transitioned.connect(on_state_transitioned)
			if child_state is PlayerState:
				child_state.player = player
	
	if initial_state:
		initial_state.enter()
		current_state = initial_state


func _process(delta: float) -> void:
	if current_state:
		current_state.update(delta)


func _physics_process(delta: float) -> void:
	if current_state:
		current_state.physics_update(delta)


func on_state_transitioned(state,new_state_name : String):
	if state != current_state:
		return
	
	var new_state = states.get(new_state_name.to_lower())
	
	if !new_state:
		return
	
	if current_state:
		current_state.exit()
	
	print(new_state)
	new_state.enter()
	NewStateTransitioned.emit(new_state)

	current_state = new_state
