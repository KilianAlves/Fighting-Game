extends CanvasLayer

@onready var main: Control = $Main


func _on_button_play_pressed():
	get_tree().change_scene_to_file("res://scenes/character_select.tscn")


func _on_button_quit_pressed():
	get_tree().quit()
