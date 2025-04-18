extends Node

signal coins_updated(amount: int)

var player: Player
var coins: int = 0
var current_checkpoint: Checkpoint


func respawn_player():
	if current_checkpoint != null:
		player.position = current_checkpoint.global_position
		player.enable_controls()


func add_coin(coins_gained: int):
	coins += coins_gained
	emit_signal("coins_updated", coins)
	print(coins)
