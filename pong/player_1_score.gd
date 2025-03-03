extends Label

func _process(delta: float) -> void:
	text = "Player 1: %d" % [Global.player1_score]
