class_name Enemy
extends Area2D

var speed: float = 80.0

func _ready() -> void:
	randomize()
	position = Vector2(randi_range(0, 400), 0)

	# Connect the collision signal
	area_entered.connect(_on_area_entered)

func _process(delta: float) -> void:
	position.y += speed * delta

func _on_area_entered(area: Area2D) -> void:
	

	if area.name == "BulletArea":
		area.get_parent().queue_free() 
		queue_free()                  
