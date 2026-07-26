extends Node

var enemy_scene = preload("res://Entities/enemies/enemy.tscn")

func _ready() -> void:
	get_parent().get_node("Boundary").area_entered.connect(_the_end)

	var timer := Timer.new()
	add_child(timer)

	timer.wait_time = 1.5
	timer.timeout.connect(_create_enemy)
	timer.start()

func _create_enemy():
	var enemy = enemy_scene.instantiate()
	get_parent().get_node("Enemies").add_child(enemy)

func _the_end(body):
	print("Something entered the boundary: ", body.name)
	if body is Enemy:
		get_tree().paused = true
		get_parent().get_node("GameOverUI").show_game_over()
