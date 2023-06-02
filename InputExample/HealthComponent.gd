extends Node
class_name HealthComponent

@export var health = 100

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func getHealth():
	return health

func subtractHealth(damage):
	health -= damage
