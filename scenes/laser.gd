extends Area2D

@export var speed = 800

func _process(delta: float) -> void:
	position.y -= speed * delta
