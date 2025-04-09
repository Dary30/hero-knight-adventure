extends Node2D


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.get_parent() is Player:
		#get_tree().change_scene_to_file("res://scenes/levels/Level" + str(int(get_tree().current_scene.name) + 1) + ".tscn")
		print("res://scenes/levels/Level" + str(int(get_tree().current_scene.name) + 1) + ".tscn")
