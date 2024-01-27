extends Control


var game = preload("res://game.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	$Credits.visible = false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_start_button_pressed():
	var instance = game.instantiate()
	instance.do_intro = true
	get_tree().root.add_child(instance)
	get_tree().root.remove_child(self)

func _on_credits_button_pressed():
	print($Credits.visible)
	$Credits.visible = not $Credits.visible

func _on_quit_button_pressed():
	get_tree().quit()
