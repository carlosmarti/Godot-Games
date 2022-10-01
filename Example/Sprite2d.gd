extends Sprite2D

var speed = 400
var angularSpeed = PI


# Called when the node enters the scene tree for the first time.
func _ready():
	var timer = get_node("Timer")
	timer.connect("timeout", self.onTimerDone())


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	rotation += angularSpeed * delta
	var velocity = Vector2.UP.rotated(rotation) * speed
	position += velocity * delta
#	var direction = 0
#	if Input.is_action_pressed("ui_left"):
#		direction = -1
#	if Input.is_action_pressed("ui_right"):
#		direction = 1
#
#	rotation += angularSpeed * direction * delta
#	var velocity = Vector2.ZERO
#	if Input.is_action_pressed("ui_up"):
#		velocity = Vector2.UP.rotated(rotation) * speed
#	position += velocity * delta


func _on_button_pressed():
	set_process(not is_processing())

func onTimerDone():
	visible = not visible
