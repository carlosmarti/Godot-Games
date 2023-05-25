extends Node

var highScore = 0
var currentScore = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func increamentScore():
	currentScore += 1
	changeScore()

func storeHighScore():
	if highScore <= currentScore:
		highScore = currentScore
	
	currentScore = 0
	
	changeScore()

func changeScore():
	var scoreLabel = get_node("/root/Game/HUD/topUI/CurrentScoreLabel")
	var highScoreLabel = get_node("/root/Game/HUD/topUI/HighScoreLabel")
	
	scoreLabel.text = "CurrentScore: " + str(currentScore)
	highScoreLabel.text = "HighScore: " + str(highScore)
