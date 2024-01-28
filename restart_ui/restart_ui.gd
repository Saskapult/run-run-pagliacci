extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	print("Fail screen")
	$AudioStreamPlayer.playing = true
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_restart_button_pressed():
	print("restart")
	var instance = preload("res://game.tscn").instantiate()
	print(instance)
	instance.do_intro = $VBoxContainer/VBoxContainer/CheckBox.button_pressed
	get_tree().root.add_child(instance)
	get_tree().root.remove_child(self)


func _on_quit_button_pressed():
	get_tree().quit()
