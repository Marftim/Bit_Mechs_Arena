extends Control


func _on_arena_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/arena.tscn")



func _on_arena_2_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/test_arena.tscn")
