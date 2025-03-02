extends Label

func _process(delta: float) -> void:
	text = "Enemy: %d" % [Global.enemy_score]
