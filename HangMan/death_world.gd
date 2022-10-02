extends Node2D

var words : Array = ["yup", "words", "dang", "games"]
var random = RandomNumberGenerator.new()
var word = ""
var randomWord = ""

func _ready():
	
	$Timer.set_one_shot(true)
	
	random.randomize()
	var randomNumber = random.randi_range(0, words.size() - 1)
	randomWord = words[randomNumber]
	
	for c in randomWord:
			word = word.insert(0, "-")
	
	$game.get_child(0).text = word
	print(randomWord)
	pass


func _on_button_pressed():
	var charGuess = true
	if $game.get_child(1).text.length() > 1:
		charGuess = false
	
	print("going into checkGuess")
	if not checkGuess($game.get_child(1).text, charGuess):
		$game.get_child(2).text = "Wrong!"
		$Timer.start(0.5)
		showLimb()
	
	$game.get_child(1).text = ""
	
	if $game.get_child(4).areAllLimbsShown():
		gameOver()

func gameOver():
	$game.visible = false
	$gameover.visible = true

func reset():
	pass

func showLimb():
	$game.get_child(4).showNextLimb()

func _changeText():
	$game.get_child(2).text = "Guess Here!"

func checkGuess(guess, cGuess):
	if cGuess:
		if guess in randomWord:
			var charPosition = []
			var pos = 0
			var oldPos = -1
			while true:
				pos = randomWord.find(guess, pos)
				
				if pos != oldPos:
					oldPos = pos
				else:
					break
				
				charPosition.append(pos)
			
			showCharacters(charPosition)
			return true
	else:
		if entireWordGuess(guess):
			word = randomWord
			$game.get_child(0).text = word
			return true
	
	return false

func showCharacters(charPos):
	for num in charPos:
		word[num] = randomWord[num]
	
	$game.get_child(0).text = word

func entireWordGuess(g) -> bool:
	
	if g.length() != randomWord.length():
		return false
	else:
		for i in range(g.length()):
			if g[i] != randomWord[i]:
				return false
	
	return true


func _on_timer_timeout():
	$game.get_child(2).text = "Guess Here!"
