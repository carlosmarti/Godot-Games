extends Node2D

var score

# Called when the node enters the scene tree for the first time.
func _ready():
	score = get_node("/root/Score")

func _input(event):
	if event is InputEventMouseButton:
		if event.is_pressed():
			if event.button_index == MOUSE_BUTTON_LEFT:
				if event.position.x < 320:
					if $Selector.getCurrentSide() == 0:
						print("Green Correct Choice")
						score.increamentScore()
						$Selector.selectNewSide()
					else:
						gameOver()
				elif event.position.x > 320:
					if $Selector.getCurrentSide() == 1:
						print("Purple Correct Choice")
						score.increamentScore()
						$Selector.selectNewSide()
					else:
						gameOver()

func gameOver():
	$Selector.hide()
	$GameOver.show()

func reset():
	score.storeHighScore()
	$Selector.show()
	$GameOver.hide()
