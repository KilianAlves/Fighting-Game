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
	givenPlayer.set_script(CharacterSelectionManager.playerScript)
	call_deferred("add_child", givenPlayer, true)


	givenOpponent.position.x = 890
	givenOpponent.position.y = 500
	if (PlayerData.isPlayer2AI):
		givenOpponent.set_script(CharacterSelectionManager.AIScript)
	else:
		givenOpponent.set_script(CharacterSelectionManager.opponentScript)

	PlayerData.player1 = givenPlayer.name
	if (givenPlayer.name == givenOpponent.name):
		PlayerData.player2 = givenOpponent.name+"2"
	else:
		PlayerData.player2 = givenOpponent.name

	call_deferred("add_child", givenOpponent, true)
