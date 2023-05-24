extends Node

var highScore = 0
var currentScore = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func increamentScore():
	currentScore += 1
	var scoreLabel = get_node("/root/Game/HUD/topUI/CurrentScoreLabel")
	scoreLabel.text = "CurrentScore: " + str(currentScore)

func storeHighScore():
	highScore = currentScore
