extends Area2D

var rng := RandomNumberGenerator.new()
var speed = rng.randi_range(300, 800)
var direction_x = rng.randf_range(-0.6, 0.6)

signal collision

func _ready() -> void:	
	var width = get_viewport().get_visible_rect().size[0]
	var random_x = rng.randi_range(0, width)
	var random_y = rng.randi_range(-150, -50)
	var scale_rng = rng.randf_range(0.5, 4)
	
	scale = Vector2(scale_rng, scale_rng)
	position = Vector2(random_x, random_y)
	
func _process(delta: float) -> void:
	position += Vector2(direction_x, 1.0) * speed * delta
	var rotate_rng = rng.randi_range(1, 6)
	rotation += rotate_rng * delta
	
func _on_body_entered(_body: Node2D) -> void:
	collision.emit()
	
func _on_area_entered(area: Area2D) -> void:
	area.queue_free()
	queue_free()
