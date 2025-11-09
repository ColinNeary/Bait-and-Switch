extends CharacterBody2D
class_name Fish

@export var MAX_SPEED:float = 250
## Max undilation of y velocity
@export var MAX_BOB_DIST:float = 50
## How often the fish with bob up and down
@export var BOB_FREQ_MULTIPLIER:float = 2
## Controls how fast the fish will move according to how low it is spawned, and vice versa
@export var depth_speed_scaling = 1.005
@export var acceleration:float = 5

@onready var sprite: Sprite2D = $Sprite2D

var elapsed_time:float = 0

func _ready() -> void:
	if self.global_position.x > 0:
		invert_fish_dir()
	
	MAX_SPEED *= pow(depth_speed_scaling, global_position.y) # scales fish speed with fish depth

func invert_fish_dir() -> void:
	MAX_SPEED *= -1
	sprite.flip_h = not sprite.flip_h

func _physics_process(delta: float) -> void:
	elapsed_time += delta
	velocity.y = MAX_BOB_DIST * sin(BOB_FREQ_MULTIPLIER*elapsed_time)
	velocity.x = move_toward(velocity.x, MAX_SPEED, acceleration*delta)
	
	move_and_slide()
