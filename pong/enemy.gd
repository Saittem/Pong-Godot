extends Node2D

@export var ball: CharacterBody2D  # Assign the ball node in the inspector
@export var speed: float = 5.0  # Adjust speed for difficulty
@export var reaction_time: float = 0.1  # Delay before AI reacts

var target_y: float = 0.0
var timer: float = 0.0

func _process(delta):
	if not ball:
		return
	
	# AI updates target position at intervals for a delay effect
	timer += delta
	if timer >= reaction_time:
		target_y = ball.position.y
		timer = 0  # Reset timer
	
	# Smoothly move towards the target Y position using lerp
	position.y = lerp(position.y, target_y, speed * delta)
