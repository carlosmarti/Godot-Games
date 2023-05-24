extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input(event):
	if event is InputEventMouseButton:
		if event.is_pressed():
			if event.button_index == MOUSE_BUTTON_LEFT:
				if event.position.x < 320:
					if $Selector.getCurrentSide() == 0:
						print("Green Correct Choice")
						var score = get_node("/root/Score")
						score.increamentScore()
						$Selector.selectNewSide()
					else:
						reset()
				elif event.position.x > 320:
					if $Selector.getCurrentSide() == 1:
						print("Purple Correct Choice")
						$Selector.selectNewSide()
					else:
						reset()

func reset():
	print("You lost bruv!")
