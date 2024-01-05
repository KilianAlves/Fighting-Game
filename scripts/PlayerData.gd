extends Node

var player1

var player2

var isPlayer2AI = true

func flip(player: Node):
	player.scale.x *= -1
	return player
