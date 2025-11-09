extends Node2D


func _on_bait_button_pressed() -> void:
	pass # Replace with function body.
var current_money:int = Globals.starting_money
@onready var money_label = $Money

func _ready() -> void:
	money_label.text = "$" + str(current_money)

func correct_answer_gotten() -> void:
	current_money += 20

func wrong_answer_gotten() -> void:
	current_money -= 50

	if current_money <= 0:
		get_tree().change_scene_to_file("res://UI/Main Menu.tscn")
