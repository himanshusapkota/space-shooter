extends Node2D

var direction: int = 0
var speed: int = 300

func _process(delta):
	if Input.is_action_pressed("left"):
		direction = -1
	elif Input.is_action_pressed("right"):
		direction = 1
	else:
		direction = 0

	position.x += direction * speed * delta
