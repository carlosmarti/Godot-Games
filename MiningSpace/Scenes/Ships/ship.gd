extends RigidBody2D

var thrust = Vector2()
var rotation_dir = 0

@export var engine_thrust = 300
@export var spin_thrust = 10000

var startPressPos = Vector2()
var tempDragPos = Vector2()
var endPressedPos = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	get_input()
	print("rotation: " + str(rotation_dir))

func _physics_process(delta):
	apply_force(thrust * delta)
	apply_torque((rotation_dir * spin_thrust) * delta)

func get_input():
	if Input.is_action_just_pressed("touch"):
		startPressPos = get_global_mouse_position()
		print("start Position: " + str(startPressPos))
	
	if Input.is_action_pressed("touch"):
		
		if tempDragPos.x < get_global_mouse_position().x:
			rotation_dir = -1
		elif tempDragPos.x > get_global_mouse_position().x:
			rotation_dir = 1
		
		tempDragPos = get_global_mouse_position()
	
	if Input.is_action_just_released("touch"):
		endPressedPos = get_global_mouse_position()
		rotation_dir = 0
		print("end position: " + str(endPressedPos))
