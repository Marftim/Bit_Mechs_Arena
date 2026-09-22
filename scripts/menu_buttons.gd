extends Control


var Port = 1234
var Ip_adress = '127.0.0.1'
@onready var menu_buttons = $"../menu_buttons"
@onready var level_buttons = $"../level_buttons"


func _on_play_pressed() -> void:
	menu_buttons.visible = false
	level_buttons.visible = true


func _on_exit_pressed() -> void:
	get_tree().quit()


func _on_settings_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/settings.tscn")

func _on_multiplayer_pressed() -> void:
	$Multiplayer.visible = false
	$Host.visible = true
	$join.visible = true



func _on_host_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/arena.tscn")
	var peer = ENetMultiplayerPeer.new()
	peer.create_server(Port, 2)
	multiplayer.multiplayer_peer = peer
	multiplayer.peer_connected.connect(connect_player)
	add_player(1)
	
	
func connect_player(id):
	add_player(id)

func add_player(id):
	
	var player = preload("res://scenes/player_1.tscn").instantiate()
	player.name = str(id)
	$"res://scenes/arena.tscn".add_child(player)

func _on_join_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/arena.tscn")
	var peer = ENetMultiplayerPeer.new()
	peer.create_client(Ip_adress, Port)
	multiplayer.multiplayer_peer = peer
