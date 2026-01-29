extends Area2D

@export var speed = 800

func _ready() -> void:
	var tween = create_tween()
	tween.tween_property($LaserSprite, "scale", Vector2(1,1), 0.2).from(Vector2(0,0))

func _process(delta: float) -> void:
	position.y -= speed * delta
