extends Area2D

@export var interact_name: String = ""
@export var is_intractable: bool = false
@export var sprite: AnimatedSprite2D

var interact: Callable = func():
	pass

func set_highlight(enabled: bool) -> void:
	if sprite and sprite.material:
		sprite.material.set_shader_parameter("outline_enabled", enabled)
