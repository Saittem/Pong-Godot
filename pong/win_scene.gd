extends Control

func _ready():
	Global.reset_scores()

func _on_back_to_manu_pressed():
	get_tree().change_scene_to_file("res://main_menu.tscn")
