extends Control

func _on_pl_vs_pl_pressed():
	get_tree().change_scene_to_file("res://game_pvp.tscn")

func _on_pl_vs_pc_pressed():
	get_tree().change_scene_to_file("res://game.tscn")
