extends Node

var score: int = 0
var current_checkpoint: Checkpoint
var player: Player


func respawn_player():
	if current_checkpoint != null:
		player.position = current_checkpoint.global_position
		player.enable_controls()


func add_point():
	score += 1
	print(score)
