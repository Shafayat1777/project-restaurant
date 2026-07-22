extends CharacterBody2D


const SPEED = 300.0
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D


func _physics_process(delta: float) -> void:

	process_movement()
	move_and_slide()


func process_movement() -> void:

	var direction := Input.get_vector("left", "right", "up", "down")

	velocity = direction * SPEED
	
	play_animation(direction)

func process_animatin() -> void:
	if velocity != Vector2.ZERO:
		play_animation()
	

func play_animation(prefix: String, dir: Vector2) -> void:
	if dir.x > 0:
		animated_sprite_2d.play(prefix + "_right")
	elif dir.x < 0:
		animated_sprite_2d.play(prefix + "_left")
	elif dir.y > 0:
		animated_sprite_2d.play(prefix + "_stand")
	elif dir.y < 0:
		animated_sprite_2d.play(prefix + "_up")
