extends Node

var LP_J1 = 100
var LP_J2 = 100

var rng = RandomNumberGenerator.new()

func J1_TakeDmg():
	var dmg = rng.randf_range(5, 12)
	print(dmg)
	LP_J1 -= dmg

func J2_TakeDmg():
	var dmg = rng.randf_range(5, 12)
	print(dmg)
	LP_J2 -= dmg
