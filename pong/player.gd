extends CharacterBody2D

#var speed = 400
#
#func get_input():
	#var inputDirection = Input.get_axis("up", "down")
	#velocity = inputDirection * speed
	#
#func _physics_process(delta):
	#get_input()

var speed = 400

func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity.y = input_direction.y * speed

func _physics_process(delta):
	get_input()
	move_and_slide()
