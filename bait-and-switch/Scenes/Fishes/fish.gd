extends CharacterBody2D

@export var MAX_SPEED:float
## Max undilation of y velocity
@export var MAX_BOB:float
@export var acceleration:float

var elapsed_time:float = 0

func _physics_process(delta: float) -> void:
	elapsed_time += delta
	velocity.y = MAX_BOB * cos(2*elapsed_time)
	velocity.x = move_toward(velocity.x, MAX_SPEED, acceleration)
	
	move_and_slide()
