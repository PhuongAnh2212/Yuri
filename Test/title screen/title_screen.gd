extends Control
@onready var click = $click

func _on_start_game_pressed():
	get_tree().change_scene_to_file("res://scenes/world.tscn") # Replace with function body.


func _on_quit_pressed():
	get_tree().quit() # Replace with function body.
