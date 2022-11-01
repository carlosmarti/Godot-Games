extends Node2D

var limbs
var allLimbsShown = false

# Called when the node enters the scene tree for the first time.
func _ready():
	limbs = [$head, $torso, $leftArm, $rightArm, $leftLeg, $rightLeg]

func showNextLimb():
	for l in limbs:
		if not l.visible:
			l.visible = true
			if l.name == "rightLeg":
				allLimbsShown = true
			break

func areAllLimbsShown():
	return allLimbsShown

func reset():
	for l in limbs:
		l.visible = false
	allLimbsShown = false
