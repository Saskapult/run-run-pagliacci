extends Control



# Called when the node enters the scene tree for the first time.
func _ready():
	$Credits.visible = false

func _on_start_button_pressed():
	var instance = load("res://game.tscn").instantiate()
	instance.do_intro = true
	get_tree().root.add_child(instance)
	get_tree().root.remove_child(self)
	pass

func _on_credits_button_pressed():
	print($Credits.visible)
	$Credits.visible = not $Credits.visible

func _on_quit_button_pressed():
	get_tree().quit()
