extends AnimatedSprite2D

@onready var interactable: Area2D = $Interactable

func _ready() -> void:
	interactable.interact = _on_interact
	

func _on_interact():
	
	if animation == "burner_on":
		material.set_shader_parameter("outline_enabled", false)
		play("default")
	else:
		material.set_shader_parameter("outline_enabled", true)
		play("burner_on")
