extends Control


func _on_pl_vs_pl_pressed() -> void:
	pass # Replace with function body.


func _on_pl_vs_pc_pressed():
	get_tree().change_scene_to_file("res://game.tscn")
