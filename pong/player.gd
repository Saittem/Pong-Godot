extends CharacterBody2D

var speed = 400
var fixed_x_position

func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity.y = input_direction.y * speed

func _ready():
	fixed_x_position = position.x

func _physics_process(delta):
	position.x = clamp(position.x, fixed_x_position, fixed_x_position)  # Locks X position
	get_input()
	move_and_slide()
