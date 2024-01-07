extends CanvasLayer

signal end
@onready var healthbar_J1 = $J1/LP
@onready var healthbar_J2 = $J2/LP
@onready var label_j1 = $Label_J1
@onready var label_j2 = $Label_J2
# Called when the node enters the scene tree for the first time.
func _ready():
	healthbar_J1.value = PLayer.LP_J1
	healthbar_J2.value = PLayer.LP_J2
	label_j1.text = CharacterSelectionManager.player_name
	label_j2.text = CharacterSelectionManager.opponent_name

	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	healthbar_J1.value = PLayer.LP_J1
	healthbar_J2.value = PLayer.LP_J2
	if healthbar_J1.value == 0:
		PLayer.PlayerWin = false
		end.emit()
	if healthbar_J2.value == 0:
		PLayer.PlayerWin = true
		end.emit()


func _on_end_reload():
	get_tree().reload_current_scene()
