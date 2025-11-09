extends CharacterBody2D

@export var target_speed:float = 100
@export var acceleration:float = 2

var target_direction:Vector2 = Vector2(0, 0)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("move_left"):
		target_direction = Vector2.LEFT
	elif event.is_action_pressed("move_right"):
		target_direction = Vector2.RIGHT
	elif event.is_action_pressed("release"):
		pass
	else:
		target_direction = Vector2.ZERO

func _physics_process(delta: float) -> void:
	velocity = velocity.move_toward(target_direction * target_speed, acceleration*delta)
