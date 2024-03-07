extends Node

class_name Statemachine

@onready var Parent = get_parent()
@export var LoadedStates:Array[StringName]

var State:StringName
var PreviousState = null
var States:Dictionary = {}

func _ready() -> void:
	for state in LoadedStates:
		add_state(state)
	call_deferred("_set_state", LoadedStates[0])
	_get_ready()

func _get_ready() -> void:
	pass

func _physics_process(delta:float) -> void:
	
	if State != null:
		var transition = _get_transition(delta)
		if transition !=null:
			_set_state(transition)

func _state_logic(_delta:float)-> void:
	pass

func _get_transition(_delta):
	return null

func _enter_state(_newstate,_oldstate)-> void:
	pass

func _exit_state(_oldstate,_newstate)-> void:
	pass

func _set_state(newstate) -> void:
	PreviousState = State #Take the current state and make it the previous one
	State = newstate #takes the argument and set it as the new state 
	
	if PreviousState != null:
		_exit_state(PreviousState,newstate)
	if newstate != null:
		_enter_state(newstate,PreviousState)

func add_state(statename)-> void:
	States[statename] = statename
