extends CharacterBody2D

var ballSpeed = 10
var audio_player : AudioStreamPlayer2D

func _ready() -> void:
	audio_player = get_node("scoreAudioPlayer")
	reset_ball()  # Use reset_ball to initialize the ball's velocity
	
func _physics_process(delta: float) -> void:

	var collision = move_and_collide(velocity)
	
	if collision:
		var collision_normal = collision.get_normal()
		velocity = velocity.bounce(collision_normal)
		
		# Check if the ball collided with a goal
		if collision.get_collider().is_in_group("playerScore"):
			Global.enemy_score += 1
			print("Enemy Score: ", Global.enemy_score)
			scoreAudio()
			reset_ball()
		elif collision.get_collider().is_in_group("enemyScore"):
			Global.player_score += 1
			print("Player Score: ", Global.player_score)
			scoreAudio()
			reset_ball()
		elif collision.get_collider().is_in_group("player1Score"):
			Global.player1_score += 1
			print("Player1 Score: ", Global.player1_score)
			scoreAudio()
			reset_ball()
		elif collision.get_collider().is_in_group("player2Score"):
			Global.player2_score += 1
			print("Player 2 Score: ", Global.player2_score)
			scoreAudio()
			reset_ball()

func scoreAudio():
		audio_player.play()

func reset_ball():
	# Reset the ball's position to the center
	position = Vector2(DisplayServer.window_get_size().x / 2, DisplayServer.window_get_size().y / 2)

	# Stop the ball temporarily
	velocity = Vector2.ZERO  

	# Wait for 500ms (0.5 seconds) before restarting movement
	await get_tree().create_timer(0.5).timeout  

	# Generate a random angle that avoids straight directions
	var random_angle = get_random_angle_with_exclusions()
	
	# Calculate the velocity vector based on the random angle
	velocity = Vector2(cos(random_angle), sin(random_angle)) * ballSpeed

func get_random_angle_with_exclusions() -> float:
	# Define the excluded angle ranges (in radians)
	var excluded_ranges = [
		deg_to_rad(-10), deg_to_rad(10),  # Exclude angles close to 0° (right)
		deg_to_rad(80), deg_to_rad(100),  # Exclude angles close to 90° (up)
		deg_to_rad(170), deg_to_rad(190), # Exclude angles close to 180° (left)
		deg_to_rad(260), deg_to_rad(280)  # Exclude angles close to 270° (down)
	]
	
	var random_angle: float
	var is_valid_angle: bool = false
	
	# Keep generating random angles until a valid one is found
	while not is_valid_angle:
		random_angle = randf_range(0, 2 * PI)
		is_valid_angle = true
		
		# Check if the angle falls within any of the excluded ranges
		for i in range(0, excluded_ranges.size(), 2):
			if random_angle >= excluded_ranges[i] and random_angle <= excluded_ranges[i + 1]:
				is_valid_angle = false
				break
	
	return random_angle
