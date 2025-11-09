extends Node2D

@export var item:PackedScene
@export var spawn_delay:float = 2
@export var MAX_BOB:float = 250
@onready var timer = $Timer

var elasped_time = 0

func _ready() -> void:
	timer.start(spawn_delay)

func _on_timer_timeout() -> void:
	spawn_item()

func spawn_item() -> void:
	var new_item = item.duplicate().instantiate()
	
	new_item.global_position = self.global_position
	get_node(Globals.fishes_nodePath).add_child(new_item)

func _physics_process(delta: float) -> void:
	elasped_time += delta
	self.position.y = MAX_BOB * sin(elasped_time)
