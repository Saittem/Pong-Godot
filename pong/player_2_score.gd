extends Label

func _process(delta: float) -> void:
	text = "Player 2: %d" % [Global.player2_score]
