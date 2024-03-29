extends Area2D

@export var damage = 10
@export var speed = 1000

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if position.x > get_viewport_rect().size.x or position.x < 0 or position.y > get_viewport_rect().size.y or position.y < 0:
		print("freeing bullet")
		self.queue_free()
	
	position += transform.x * speed * delta

func getDamage():
	return damage
