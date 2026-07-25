extends Node2D

var bullet_scene = preload("res://Entities/Bullet/bullet.tscn")
var direction: int = 0
var speed: int = 300
var shoot_time: float = 1.0
var shoot_counter: float = 0.0

func _ready():
	pass

func _process(delta):
	shoot_counter += delta
	if Input.is_action_pressed("shoot") and shoot_counter > shoot_time:
		shoot_counter = 0
		var bullet_instance = bullet_scene.instantiate()
		bullet_instance.position.x = position.x
		bullet_instance.position.y = position.y - 50
		get_tree().current_scene.get_node("Bullets").add_child(bullet_instance)

	if Input.is_action_pressed("left"):
		direction = -1
	elif Input.is_action_pressed("right"):
		direction = 1
	else:
		direction = 0

	position.x += direction * speed * delta
	position.x = clamp(position.x, 15, 385)
