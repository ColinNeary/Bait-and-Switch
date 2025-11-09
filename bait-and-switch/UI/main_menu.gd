extends Node2D

var game_path:String = "res://Scenes/Game/Game.tscn"


func _on_easy_button_pressed() -> void:
	Globals.starting_money = 200
	get_tree().change_scene_to_file(game_path)


func _on_medium_button_pressed() -> void:
	Globals.starting_money = 100
	get_tree().change_scene_to_file(game_path)


func _on_hard_button_pressed() -> void:
	Globals.starting_money = 50
	get_tree().change_scene_to_file(game_path)
