extends Area2D



func _on_body_entered(body: Node2D) -> void:
	if body is Fish:
		print("killing fish")
		body.queue_free()
