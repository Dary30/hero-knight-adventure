extends Control

@onready var main_buttons: VBoxContainer = $MainButtons
@onready var option_menu: Panel = $OptionMenu


func _ready() -> void:
	main_buttons.visible = true
	option_menu.visible = false


func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://src/levels/level_0.tscn")


func _on_options_pressed() -> void:
	main_buttons.visible = false
	option_menu.visible = true


func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_back_pressed() -> void:
	_ready()
