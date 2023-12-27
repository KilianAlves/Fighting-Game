extends Node

@onready var givenPlayer = CharacterSelectionManager.player.instantiate()
@onready var givenOpponent = CharacterSelectionManager.opponent.instantiate() 

func _ready():
#	print(CharacterSelectionManager.player1Character)
	SpawnChosenCharacters()

# At the start of the game the chosen characters need to be spawned in and also receive an offset to eachother
func SpawnChosenCharacters():
	givenPlayer.position.x = 288
	givenPlayer.position.y = 400
	
	call_deferred("add_child", givenPlayer)

	givenOpponent.position.x = 890
	givenOpponent.position.y = 400
	var sripte = givenOpponent._animation_player
	sripte.flip_h = true

	
	call_deferred("add_child", givenOpponent)
