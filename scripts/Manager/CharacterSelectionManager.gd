extends Node

var player 
var playerScript = preload("res://scripts/Player1.gd")

var opponent
var opponentScript = preload("res://scripts/Player2.gd")

var selectableCharacters = {
	"Sagat" : preload("res://characters/Sagat/Scenes/Sagat.tscn"),
	"Vega" : preload("res://characters/Vega/Scenes/Vega.tscn"),
}
