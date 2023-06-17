extends Node
class_name EnergyComponent

@export var energy = 100
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func consumedEnergy(amount):
	energy -= amount

func addEnergy(amount):
	energy += amount

func getEnergy():
	return energy
