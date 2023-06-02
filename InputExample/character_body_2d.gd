extends CharacterBody2D

const JUMP_VELOCITY = -800.0

var screenRelativeX = 0.0
var tempScreenDragX = 0.0
@export var speed : float = 100
@export var jump_height : float
@export var jump_time_to_peak: float
@export var jump_time_to_desent: float

@onready var jump_velocity : float = ((2.0 * jump_height) / jump_time_to_peak) * -1.0
@onready var jump_gravity : float = ((-2.0 * jump_height) / (jump_time_to_peak * jump_time_to_peak)) * -1.0
@onready var fall_gravity : float = ((-2.0 * jump_height) / (jump_time_to_desent * jump_time_to_desent)) * -1.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	
	velocity.y += getGravity() * delta
	velocity.x = getHorizontalSpeed(screenRelativeX, delta)
	
	if is_on_floor() and screenRelativeX != 0.0:
		screenRelativeX = 0.0
	
	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = jump_velocity
	
	print("Velocity x of Character: " + str(velocity.x))
	move_and_slide()

func getGravity():
	return jump_gravity if velocity.y < 0.0 else fall_gravity

func getHorizontalSpeed(directionX, delta):
	
	return lerp(velocity.x, directionX, speed * delta)

func _input(event):
	
	if event is InputEventScreenDrag:
		tempScreenDragX = event.get_relative().x * 5
	
	if event is InputEventScreenTouch:
		if !event.is_pressed():
			screenRelativeX = tempScreenDragX
			print("relative x: " + str(screenRelativeX))
			tempScreenDragX = 0.0
	

