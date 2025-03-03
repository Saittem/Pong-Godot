extends Label

var audio_player : AudioStreamPlayer2D

func _ready():
	audio_player = get_node("winAudioPlayer")
	if Global.player_score == 8:
		text = "Player Wins"
	elif Global.enemy_score == 8:
		text = "Enemy Wins"
	elif Global.player1_score == 8:
		text = "Player 1 Wins"
	elif Global.player2_score == 8:
		text = "Player 2 Wins"
	audio_player.play()
