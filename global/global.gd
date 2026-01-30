extends Node

signal score_changed

var score := 0

func add_score(amount: int) -> void:
	score += amount
	score_changed.emit(score)
