extends CharacterBody2D

@export var speed = 700

signal laser(pos)
var can_shoot : bool = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position = Vector2(600, 580)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	var direction = Input.get_vector("left","right","up","down")
	velocity = speed * direction
	move_and_slide()
	if Input.is_action_just_pressed("shoot") and can_shoot:
		laser.emit($LaserStartPosition.global_position)
		can_shoot = false
		$ShootCooldown.start()
		$LaserSound.play()

func _on_shoot_cooldown_timeout() -> void:
	can_shoot = true
	
func play_collision_sound():
	$DamageSound.play()
