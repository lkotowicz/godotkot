extends Node2D

#Button Play
func _on_Play_pressed() -> void:
	get_tree().change_scene_to_file("res://Sceny/world.tscn")

func _on_Play2_pressed() -> void:
	get_tree().change_scene_to_file("res://Sceny/world_2.tscn")
func _on_Quit_pressed() -> void:
	get_tree().quit()
