extends Area2D

var is_player_dead: bool = false

@onready var timer: Timer = $Timer


func _on_body_entered(body: Node2D) -> void:
	if is_player_dead:
		return
	
	print("You died!!")
	is_player_dead = true
	Engine.time_scale = 0.5
	
	if body.has_method("disable_controls"):
		body.disable_controls()
	
	timer.start()


func _on_timer_timeout() -> void:
	Engine.time_scale = 1
	GameManager.respawn_player()
	is_player_dead = false
