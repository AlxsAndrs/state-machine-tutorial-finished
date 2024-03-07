extends Statemachine

@export var Animationplayer:AnimationPlayer

func _get_ready() -> void:

	pass

func _state_logic(_delta) -> void:

	match State:
		States.idle:
			Parent.apply_gravity()
			Parent.apply_movements()
			Parent.jump()
		States.run:
			Parent.apply_gravity()
			Parent.apply_movements()
			Parent.jump()
		States.jump:
			Parent.apply_gravity()
			Parent.apply_movements()
		States.fall:
			Parent.apply_gravity()
			Parent.apply_movements()

func _get_transition(_delta):

	match State:
		States.idle:
			if !Parent.is_on_floor():
				if Parent.velocity.y < 0:
					return States.jump
				else:
					return States.fall
			else:
				if Parent.velocity.x != 0:
					return States.run
		States.run:
			if !Parent.is_on_floor():
				if Parent.velocity.y < 0:
					return States.jump
				else:
					return States.fall
			else:
				if Parent.velocity.x == 0:
					return States.idle
		States.jump:
			if Parent.is_on_floor():
				if Parent.velocity.x == 0:
					return States.idle
				else:
					return States.run
			else:
				if Parent.velocity.y > 0:
					return States.fall
		States.fall:
			if Parent.is_on_floor():
				if Parent.velocity.x == 0:
					return States.idle
				else:
					return States.run
			else:
				if Parent.velocity.y < 0:
					return States.jump

func _enter_state(newstate,_oldstate) -> void:

	match newstate:
		States.idle:
			Animationplayer.play("idle")
		States.run:
			Animationplayer.play("run")
		States.jump:
			Animationplayer.play("jump")
		States.fall:
			Animationplayer.play("fall")

func _exit_state(_oldstate,_newstate) -> void:

	pass
