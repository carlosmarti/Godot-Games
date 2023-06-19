extends Node
class_name AmmoComponent

@export var maxAmmo = 20
@onready var bullet = preload("res://Scenes/Miscellaneous/Bullet/bullet.tscn")
@onready var ammo = maxAmmo
 
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func usedAmmo(amount):
	if (ammo - amount) < 0:
		ammo = 0
	else:
		ammo -= amount

func restoredAmmo(amount):
	if (ammo + amount) > maxAmmo:
		ammo = maxAmmo
	else:
		ammo += amount

func getBullet():
	return bullet

func getAmmo():
	return ammo
