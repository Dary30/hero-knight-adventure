extends CanvasLayer

@onready var coin_counter: Label = $HBoxContainer/CoinCounter


func _ready() -> void:
	GameManager.coins_updated.connect(_update_coin_display)
	print("ready")


func _update_coin_display(amount: int) -> void:
	coin_counter.text = str(amount)
	print("update_coin_display")
