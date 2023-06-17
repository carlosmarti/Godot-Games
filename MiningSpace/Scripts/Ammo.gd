extends Node
class_name AmmoComponent

@export var ammo = 20
@onready var bullet = preload("res://Scenes/Miscellaneous/Bullet/bullet.tscn")
 
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func usedAmmo(amount):
	ammo -= amount

func restoredAmmo(amount):
	ammo += amount

func getBullet():
	return bullet
