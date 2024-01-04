extends Node

var player
var player_name
var playerScript = preload("res://scripts/Player1.gd")

var opponent
var opponent_name
var opponentScript = preload("res://scripts/Player2.gd")

var selectableCharacters = {
	"Sagat" : preload("res://characters/Sagat/Scenes/Sagat.tscn"),
	"Vega" : preload("res://characters/Vega/Scenes/Vega.tscn"),
	"Fei_Long" : preload("res://characters/Feilong/Scene/Feilong.tscn"),
	"Blanka" : preload("res://characters/Blanka/Scenes/Blanka.tscn"),
	"M_Bison": preload("res://characters/Bison/Scenes/Bison.tscn"),
}
