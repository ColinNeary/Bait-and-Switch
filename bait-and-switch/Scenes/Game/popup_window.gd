extends Panel

var is_bait = false


func create_new_message() -> void:
	var email = self.get_child(randi() % 5)
	self.visible = true
	email.visible = true
	if email.name.contains("False"):
		is_bait = true
	else:
		is_bait = false

func _on_bait_button_pressed() -> void:
	self.visible = false
	if is_bait:
		self.get_parent().get_parent().correct_answer_gotten()
	else:
		self.get_parent().get_parent().wrong_answer_gotten()

func _on_reel_button_pressed() -> void:
	self.visible = false
	if !is_bait:
		self.get_parent().get_parent().correct_answer_gotten()
	else:
		self.get_parent().get_parent().wrong_answer_gotten()
