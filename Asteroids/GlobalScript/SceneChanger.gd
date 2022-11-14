extends Node

var currentScene = null
# Called when the node enters the scene tree for the first time.
func _ready():
	var root = get_tree().root
	currentScene = root.get_child(root.get_child_count() - 1)

func changeScene(path):
	call_deferred("deferredChangeScene", path)

func deferredChangeScene(path):
	currentScene.free()
	
	var scene = ResourceLoader.load(path)
	currentScene = scene
	
	get_tree().current_scene = currentScene
