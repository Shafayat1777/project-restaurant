extends AnimatedSprite2D

@onready var interactable: Area2D = $Interactable

func _ready() -> void:
	interactable.interact = _on_interact
	

func _on_interact():
	
	if animation == "burner_on":
		print("on")
		play("default")
	else:
		print("off")
		play("burner_on")
