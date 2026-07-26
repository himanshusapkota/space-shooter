extends Node2D

var score: int = 0

func _ready() -> void:
	update_score_label()

func _process(delta: float) -> void:
	pass

func add_score(amount: int) -> void:
	score += amount
	update_score_label()

func update_score_label() -> void:
	$ScoreLabel.text = "Score: %d" % score
