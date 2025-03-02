extends CharacterBody2D

@export var ball: NodePath  # Reference to the ball node
@export var delay: float = 0.5  # Delay in seconds (500ms)

var target_y: float  # Target Y position to follow
var tween: Tween  # Tween for smooth movement

func _ready() -> void:
	# Initialize the tween
	tween = create_tween()
	tween.set_loops()  # Make the tween loop indefinitely

	# Start following the ball
	if ball:
		follow_ball()

func _physics_process(delta: float) -> void:
	# Update the enemy's position based on the target Y position
	position.y = target_y

func follow_ball() -> void:
	# Get the ball node
	var ball_node = get_node(ball)
	
	# Connect to the ball's position changes
	ball_node.connect("position_changed", _on_ball_position_changed)

func _on_ball_position_changed(new_position: Vector2) -> void:
	# Set the target Y position with a delay
	target_y = new_position.y
	
	# Stop any existing tween
	tween.stop()
	
	# Start a new tween to smoothly move to the target Y position
	tween.tween_property(self, "position:y", target_y, delay)
