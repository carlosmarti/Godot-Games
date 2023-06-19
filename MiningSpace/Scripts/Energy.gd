extends Node
class_name EnergyComponent

@export var maxEnergy = 100

var energy
# Called when the node enters the scene tree for the first time.
func _ready():
	energy = maxEnergy

func consumedEnergy(amount):
	if (energy - amount) < 0:
		energy = 0
	else:
		energy -= amount

func addEnergy(amount):
	if (energy + amount) > maxEnergy:
		energy = maxEnergy
	else:
		energy += amount

func getEnergy():
	return energy
