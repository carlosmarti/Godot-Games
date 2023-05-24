extends Node2D

var currentSide = 0
enum Select {arrowLeft, arrowRight, colorLeft, colorRight}

var leftArrow = preload("res://arrow.png")
var rightArrow = preload("res://rightArrow.png")
var purpleColor = Color(0,153, 153, 1)
var greenColor = Color(0,1,0,1)

# Called when the node enters the scene tree for the first time.
func _ready():
	selectNewSide()

func selectNewSide():
	var randNum = randi_range(0, 3)
	match randNum:
		Select.arrowLeft:
			setUpSelector(Select.arrowLeft)
			currentSide = 0
		Select.arrowRight:
			setUpSelector(Select.arrowRight)
			currentSide = 1
		Select.colorLeft:
			setUpSelector(Select.colorLeft)
			currentSide = 0
		Select.colorRight:
			setUpSelector(Select.colorRight)
			currentSide = 1

func getCurrentSide():
	return currentSide

func setUpSelector(type):
	match type:
		Select.arrowLeft:
			$arrow.set_texture(leftArrow)
		Select.arrowRight:
			$arrow.set_texture(rightArrow)
		Select.colorLeft:
			removeImg()
			$backgroundColor.color = greenColor
		Select.colorRight:
			removeImg()
			$backgroundColor.color = purpleColor

func removeImg():
	if $arrow.texture != null:
		$arrow.set_texture(null)
