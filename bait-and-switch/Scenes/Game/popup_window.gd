extends Panel

var is_bait = false

func _ready() -> void:
	$"../../Hook".fish_is_caught.connect(create_new_message)
	pass

func create_new_message() -> void:
	var email = self.get_child(randi() % 6)
	email.visible = true
	self.visible = true
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
