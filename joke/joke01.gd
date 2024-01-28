extends Control


@export var player: Node2D

func _ready():
	hide()


func do_joke():
	show()
	
	get_tree().paused = true
	$HBoxContainer/VBoxContainer/Fox.visible = false
	$HBoxContainer/VBoxContainer/Fast.visible = false
	$HBoxContainer/VBoxContainer2/Other.visible = false
	$HBoxContainer/VBoxContainer2/Idk.visible = false
	var tween = get_tree().create_tween()
	tween.set_pause_mode(Tween.TWEEN_PAUSE_PROCESS)
	tween.tween_interval(0.25)
	tween.tween_callback(func show1(): $HBoxContainer/VBoxContainer/Fox.visible = true)
	tween.tween_interval(0.25)
	tween.tween_callback(func show1(): $HBoxContainer/VBoxContainer2/Other.visible = true)
	tween.tween_interval(0.25)
	tween.tween_callback(func show1(): $HBoxContainer/VBoxContainer/Fast.visible = true)
	tween.tween_interval(0.25)
	tween.tween_callback(func show1(): $HBoxContainer/VBoxContainer2/Idk.visible = true)


func _on_fox_pressed():
	print("Fade player and stuff idk")
	done_joke()


func _on_fast_pressed():
	print("Make player faster pls")
	player.speed_boost()
	done_joke()


func _on_other_pressed():
	print("Good particles?")
	done_joke()


func _on_idk_pressed():
	print("No effect")
	done_joke()

func done_joke():
	get_tree().paused = false
	hide()
