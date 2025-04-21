extends Node2D


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.get_parent() is Player:
		var current_level = int(get_tree().current_scene.name)
		var next_level_path = "res://src/levels/level_" + str(current_level + 1) + ".tscn"
		call_deferred("change_level", next_level_path)


func change_level(path: String) -> void:
	get_tree().change_scene_to_file(path)
