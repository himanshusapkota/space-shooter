extends Node

var enemy_scene = preload("res://Entities/enemies/enemy.tscn")

func _ready() -> void:
	var timer = Timer.new()
	add_child(timer)

	timer.wait_time = 1.5
	timer.timeout.connect(_create_enemy)
	timer.start()

func _create_enemy():
	var enemy = enemy_scene.instantiate()
	get_parent().get_node("Enemies").add_child(enemy)
