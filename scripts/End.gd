extends CanvasLayer
var simultaneous_scene = preload("res://scenes/character_select.tscn").instantiate()
signal reload
@onready var PanPlayer = $Panel/Player


func _ready():
	hide()

func _on_replay_pressed():
	restart()
	get_tree().change_scene_to_file("res://scenes/mode_select.tscn")


func _on_quit_pressed():
	restart()
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
	
func _on_canvas_layer_end():
	PLayer.end = true
	print(CharacterSelectionManager.player_name)
	if PLayer.PlayerWin:
		PanPlayer.text = CharacterSelectionManager.player_name
	else: 
		PanPlayer.text = CharacterSelectionManager.opponent_name
	show()


func restart():
	CharacterSelectionManager.player = null
	CharacterSelectionManager.player_name= null
	CharacterSelectionManager.opponent= null
	CharacterSelectionManager.opponent_name= null
	PLayer.LP_J1 = 100
	PLayer.LP_J2 = 100
	PLayer.PlayerWin = false
	PlayerData.player1= null
	PlayerData.player2= null
	PlayerData.isPlayer2AI = true
