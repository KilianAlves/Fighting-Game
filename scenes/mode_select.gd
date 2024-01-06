extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_button_pvp_pressed():
	PlayerData.isPlayer2AI = false
	get_tree().change_scene_to_file("res://scenes/character_select.tscn")

func _on_button_pvb_pressed():
	PlayerData.isPlayer2AI = true
	get_tree().change_scene_to_file("res://scenes/character_select.tscn")
	
