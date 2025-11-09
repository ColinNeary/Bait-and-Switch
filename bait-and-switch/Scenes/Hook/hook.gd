extends CharacterBody2D

signal fish_is_caught()

@export var target_speed:float = 100
@export var acceleration:float = 2


func _input(_event: InputEvent) -> void:
	if Input.is_action_pressed("move_left"):
		velocity.x = -200
	elif Input.is_action_pressed("move_right"):
		velocity.x = 200
	elif Input.is_action_just_pressed("release"):
		velocity.y = 400
	else:
		velocity.x = 0

func _physics_process(_delta: float) -> void:
	if self.global_position.y > 250:
		velocity.y = -350
	elif self.global_position.y < -271:
		var fish_caught = false
		for child in self.get_children():
			if child is Fish:
				fish_caught = true
				child.queue_free()
		if fish_caught: 
			fish_is_caught.emit()
		
		velocity.y = 0
		self.global_position.y += 1
	
	move_and_slide()


func _on_hook_zone_body_entered(body: Node2D) -> void:
	if body is Fish:
		body.process_mode = Node.PROCESS_MODE_DISABLED
		body.reparent(self)
