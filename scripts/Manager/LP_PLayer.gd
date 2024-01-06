extends Node
var LP_J1 = 100
var LP_J2 = 100
var rng = RandomNumberGenerator.new()
var end = false
var PlayerWin = false
var J1_Dmg = false
var J2_Dmg = false
var J1_IsBlocking = false
var J2_IsBlocking = true
func J1_TakeDmg():
	var dmg = rng.randf_range(5, 12)
	print(dmg)
	LP_J1 -= dmg
	J1_Dmg = true

func J2_TakeDmg():
	var dmg = rng.randf_range(5, 12)
	print(dmg)
	LP_J2 -= dmg
	J2_Dmg = true
