extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_restart_button_down():
	get_parent().reset()


func _on_exit_button_down():
	get_tree().quit()
