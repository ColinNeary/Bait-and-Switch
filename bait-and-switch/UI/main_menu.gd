extends Node2D

var game_path:String = "res://Game/game.tscn"

func _on_button_pressed() -> void:
	get_tree().change_scene_to_file(game_path)
