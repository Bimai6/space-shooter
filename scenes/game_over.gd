extends Control

func _ready() -> void:
	$CenterContainer/VBoxContainer/Label2.text = $CenterContainer/VBoxContainer/Label2.text + str(Global.score)

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("restart"):
		get_tree().change_scene_to_file("res://scenes/level.tscn")
