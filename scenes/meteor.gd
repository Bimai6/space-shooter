extends Area2D

var rng := RandomNumberGenerator.new()
var speed = rng.randi_range(300, 800)
var direction_x = rng.randf_range(-0.6, 0.6)

func _ready() -> void:	
	var width = get_viewport().get_visible_rect().size[0]
	var random_x = rng.randi_range(0, width)
	var random_y = rng.randi_range(-150, -50)
	var scale_rng = rng.randi_range(0.5, 4)
	
	scale = Vector2(scale_rng, scale_rng)
	position = Vector2(random_x, random_y)
	
func _process(delta: float) -> void:
	position += Vector2(direction_x, 1.0) * speed * delta
	var rotate_rng = rng.randi_range(1, 6)
	rotation += rotate_rng * delta
	
func _on_body_entered(body: Node2D) -> void:
	pass # Replace with function body.
