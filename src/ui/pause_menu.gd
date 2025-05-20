extends CanvasLayer

@onready var pause_menu: CanvasLayer = $"."
@onready var pause_buttons: Panel = $Panel
@onready var option_menu: Panel = $OptionMenu


func _ready() -> void:
	pause_menu.visible = false
	option_menu.visible = false


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		if get_tree().paused:
			resume()
		else:
			pause()


func pause():
	get_tree().paused = true
	pause_menu.visible = true


func resume():
	get_tree().paused = false
	pause_menu.visible = false


func _on_resume_pressed() -> void:
	resume()


func _on_options_pressed() -> void:
	pause_buttons.visible = false
	option_menu.visible = true


func _on_main_menu_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://src/ui/main_menu.tscn")


func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_back_pressed() -> void:
	pause_buttons.visible = true
	option_menu.visible = false
