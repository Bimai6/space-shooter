extends CanvasLayer

static var image = load('res://.godot/imported/Main Ship - Base - Damaged.png-bb75aa69b584481fde61343988eec9c0.ctex')

func get_health(amount):
	for i in amount:
		var text_rect = TextureRect.new()
		text_rect.texture = image
		$MarginContainer2/HBoxContainer.add_child(text_rect)

func set_health(amount):
	if amount >= 0:
		var last_child = $MarginContainer2/HBoxContainer.get_child(amount)
		last_child.queue_free()

func _ready():
	Global.score_changed.connect(update_score_label)
	update_score_label(Global.score)

func _on_score_timer_timeout() -> void:
	Global.add_score(1)

func update_score_label(value: int) -> void:
	$MarginContainer/Label.text = str(value)
