extends Node2D

var current_money:int = Globals.starting_money
@onready var money_label = $Money

func _ready() -> void:
	money_label.text = "$" + str(current_money)
