extends AnimatedSprite2D

@onready var interactable: Area2D = $Interactable

var is_on := false

func _ready() -> void:
	interactable.interact = _on_interact

func _on_interact():
	if is_on:
		# Turn off: play turning_off, then default
		play("closing")
		await animation_finished
		play("default")
		is_on = false
	else:
		# Turn on: play turning_on, then burner_on
		play("opening")
		await animation_finished
		play("open")
		is_on = true
