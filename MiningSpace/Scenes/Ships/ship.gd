extends RigidBody2D

var thrust = Vector2()
var rotation_dir = 0

@export var engine_forward_thrust = 50000
@export var engine_backward_thrust = 10000
@export var spin_thrust = 10000

var startPressPos = Vector2()
var endPressedPos = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	get_input()

func _physics_process(delta):
	apply_force(thrust)
	apply_torque((rotation_dir * spin_thrust) * delta)
	
	if thrust > Vector2.ZERO or thrust < Vector2.ZERO:
		thrust = Vector2.ZERO

func get_input():
	if Input.is_action_just_pressed("touch"):
		startPressPos = get_global_mouse_position()
	
	if Input.is_action_pressed("touch"):
		if startPressPos.x < get_global_mouse_position().x - 30:
			rotation_dir = -1
		elif startPressPos.x > get_global_mouse_position().x + 30:
			rotation_dir = 1
	
	if Input.is_action_just_released("touch"):
		endPressedPos = get_global_mouse_position()
		rotation_dir = 0
		if startPressPos == endPressedPos:
			#add shooting algo here
			var bullet = $AmmoComponent.getBullet().instantiate()
			owner.add_child(bullet)
			bullet.transform = $Marker2D.global_transform
		else:
			if (startPressPos.y - endPressedPos.y) >= 50:
				thrust = transform.x * engine_forward_thrust 
			elif (startPressPos.y - endPressedPos.y) <= -50:
				thrust = transform.x * engine_backward_thrust * -1
