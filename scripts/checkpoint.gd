extends Node2D
class_name Checkpoint

var activated: bool = false
var raised: bool = false
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D


func activate():
	GameManager.current_checkpoint = self
	activated = true
	if not raised:
		animated_sprite.play("rising")
		raised = true


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.get_parent() is Player and not activated:
		activate()


func _on_animation_finished() -> void:
	if animated_sprite.animation == "rising":
		animated_sprite.play("active")
