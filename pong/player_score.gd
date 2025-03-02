extends Label

func _process(delta: float) -> void:
	text = "Player: %d" % [Global.player_score]
