extends Panel

var is_bait = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_bait_button_pressed() -> void:
	self.visible = false
	# if is_bait:
		
	pass # Replace with function body.


func _on_reel_button_pressed() -> void:
	self.visible = false
	# if !is_bait:
	pass # Replace with function body.
