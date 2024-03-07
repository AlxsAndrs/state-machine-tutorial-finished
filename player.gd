extends CharacterBody2D

var Speed:float = 150.0

var Jump:float = 250.0

var Gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta) -> void:

	%StateMachine._state_logic(delta)
	move_and_slide()

func apply_gravity() -> void:

	if !is_on_floor():
		velocity.y += Gravity

func apply_movements() -> void:

	var movex:float = Input.get_action_strength("d") - Input.get_action_strength("a")
	if movex != 0:
		velocity.x = sign(movex) * Speed
	else:
		velocity.x = 0

func jump() -> void:

	if Input.is_action_just_pressed("w"):
		velocity.y = -Jump
