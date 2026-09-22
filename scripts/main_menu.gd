extends Control

@onready var Main_buttons = $Main_Buttons
@onready var Play_Buttons = $Play_Buttons



func _on_play_pressed():
	Main_buttons.visible = false
	Play_Buttons.visible = true

func _on_settings_pressed():
	get_tree().change_scene_to_file("res://scenes/settings.tscn")

func _on_exit_pressed():
	get_tree().quit()	

func _on_arena_1_pressed():
	get_tree().change_scene_to_file("res://scenes/arena.tscn")

func _on_arena_2_pressed():
	get_tree().change_scene_to_file("res://scenes/test_arena.tscn")
