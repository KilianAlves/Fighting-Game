extends Sprite2D

@export var Sagat : Texture  # Cursor Texture for when Player 1 is making a decision    
@export var Fei_Long : Texture  # Cursor Texture for when Player 2 is making a decision
@export var Vega : Texture  # Cursor Texture for when Player 1 is making a decision    
@export var M_Bison : Texture  # Cursor Texture for when Player 2 is making a decision
@export var Blanka : Texture  # Cursor Texture for when Player 1 is making a decision    

func changeSprite(character):
	print(character)
	if(character == "Sagat"):
		texture = Sagat
	if(character == "Fei_Long"):
		texture = Fei_Long
	if(character == "Vega"):
		texture = Vega
	if(character == "M_Bison"):
		texture = M_Bison
	if(character == "Blanka"):
		texture = Blanka
