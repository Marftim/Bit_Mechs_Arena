extends TextureRect


var BG_list = ["res://techures/BG_techures/Black_huina.png", "res://techures/BG_techures/Grin_huina.png"]
var techure = Texture2D
var rand

func random():
	rand = randi_range(0, 1)
	techure = BG_list[rand]
