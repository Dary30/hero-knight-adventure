extends CheckBox


func _ready() -> void:
	button_pressed = GameManager.is_fullscreen


func _on_toggled(toggled_on: bool) -> void:
	GameManager.is_fullscreen = toggled_on
	
	if toggled_on == true:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_MAXIMIZED)
