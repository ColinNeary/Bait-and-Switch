extends Node2D

@export var item:PackedScene
@export var spawn_delay:float = 2
@onready var timer = $Timer

func _ready() -> void:
	timer.start(spawn_delay)

func _on_timer_timeout() -> void:
	spawn_item()

func spawn_item() -> void:
	var new_item = item.duplicate().instantiate()
	new_item.global_position = self.global_position
	self.add_child(new_item)
