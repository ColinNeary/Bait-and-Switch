extends Panel

var is_bait = false

var popups:Dictionary = {"From: sam@atroilia.com
Subject: Your Account Needs Action

Good Evening,

Your Capitol One Bank account has been vulnerabled by a security breach affecting thousands of americans. Please reply to this email immediately so that we can assist you further

Salutations,
CAPITOL ONE":false, "From: capitalone@update-win.com
Subject: Your Account Needs Urgent Action

This email is to notify you of a potential breach on your account. Please sign into your account at the following link to learn more: Information Protection Center.":false, "From: captialone@update-win.com
Subject: Credit One Breach Info

This email is to notify you of a potential breach on your account. Pleaz click the following link to learn mor: Information Protection Center":false, "From: support@capitalone.com
Subject: Your Account Needs Action

This email is to notify you of a potential security breach on your account. Your account has been frozen for your safety. Please speak with a live representative as soon as possible.

Thank you for being a Capital One Customer":true, "From: support@capitalone.com
Subject: Your Rewards Are Waiting

Hello,

You have unused rewards waiting on your Capital One account! Sign in to use them before they expire.

Thank you for being a Capital One Customer":true}

func _ready() -> void:
	$"../../Hook".fish_is_caught.connect(create_new_message)

func create_new_message() -> void:
	var keys = popups.keys()
	var random_key = keys.get(randi() % keys.size())
	
	$Email.text = random_key
	self.visible = true
	
	if popups.get(random_key):
		is_bait = false
	else:
		is_bait = true

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
