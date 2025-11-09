extends Node2D


func _on_bait_button_pressed() -> void:
	pass # Replace with function body.
var current_money:int = Globals.starting_money
@onready var money_label = $Money

func _ready() -> void:
	money_label.text = "$" + str(current_money)
