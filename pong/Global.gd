extends Node2D

var player_score = 0
var enemy_score = 0

var player1_score = 0
var player2_score = 0

func reset_scores():
	player_score = 0
	enemy_score = 0

func _process(delta):
	if player_score == 8 || enemy_score == 8:
		get_tree().change_scene_to_file("res://win_scene.tscn")
		
	if player1_score == 8 || player2_score == 8:
		get_tree().change_scene_to_file("res://win_scene.tscn")

func _input(event):
	if event.is_action_pressed("restart"):
		get_tree().reload_current_scene()  # Reloads the current scene
	elif event.is_action_pressed("autoWin"):
		get_tree().change_scene_to_file("res://win_scene.tscn")
