extends Panel

var is_bait = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func create_new_message() -> void:
	var email = self.get_child(randi() % 6)
	if email.name.contains("False"):
		is_bait = true
	else:
		is_bait = false
	pass

func _on_bait_button_pressed() -> void:
	self.visible = false
	if is_bait:
		self.get_parent().get_parent().correct_answer_gotten()
	else:
		self.get_parent().get_parent().wrong_answer_gotten()
	pass # Replace with function body.


func _on_reel_button_pressed() -> void:
	self.visible = false
	if !is_bait:
		self.get_parent().get_parent().correct_answer_gotten()
	else:
		self.get_parent().get_parent().wrong_answer_gotten()
	pass # Replace with function body.
