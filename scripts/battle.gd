extends Node

@onready var givenPlayer = CharacterSelectionManager.player.instantiate()
@onready var givenOpponent = CharacterSelectionManager.opponent.instantiate() 

func _ready():
#	print(CharacterSelectionManager.player1Character)
	SpawnChosenCharacters()

# At the start of the game the chosen characters need to be spawned in and also receive an offset to eachother
func SpawnChosenCharacters():
	givenPlayer.position.x = 288
	givenPlayer.position.y = 500
	
	call_deferred("add_child", givenPlayer)

	givenOpponent.position.x = 890
	givenOpponent.position.y = 500

	
	call_deferred("add_child", givenOpponent)
