extends Node2D

var BG_list = ["res://techures/BG_techures/Black_huina.png", "res://techures/BG_techures/Grin_huina.png"]

func _ready():
	change_image()

func change_image():
	var random_index = randi_range(0,BG_list.size() - 1)
	var texture = load(BG_list[random_index])
	
	if texture:
		$TextureRect.texture = texture
	else:
		print("ERROR")
