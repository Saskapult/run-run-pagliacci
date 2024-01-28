extends Control


@export var player: Node2D

func _ready():
	hide()


func do_joke():
	show()
	$AudioStreamPlayer.playing = true
	get_tree().paused = true
	$HBoxContainer/VBoxContainer/Penguin.visible = false
	$HBoxContainer/VBoxContainer/Carrot.visible = false
	$HBoxContainer/VBoxContainer2/Robin.visible = false
	$HBoxContainer/VBoxContainer2/Crush.visible = false
	var tween = get_tree().create_tween()
	tween.set_pause_mode(Tween.TWEEN_PAUSE_PROCESS)
	tween.tween_interval(0.25)
	tween.tween_callback(func show1(): $HBoxContainer/VBoxContainer/Penguin.visible = true)
	tween.tween_interval(0.25)
	tween.tween_callback(func show1(): $HBoxContainer/VBoxContainer2/Robin.visible = true)
	tween.tween_interval(0.25)
	tween.tween_callback(func show1(): $HBoxContainer/VBoxContainer/Carrot.visible = true)
	tween.tween_interval(0.25)
	tween.tween_callback(func show1(): $HBoxContainer/VBoxContainer2/Crush.visible = true)


func _on_fox_pressed():
	# penguin
	done_joke()


func _on_fast_pressed():
	# Carrot
	print("Make player faster pls")
	player.speed_boost()
	done_joke()


func _on_other_pressed():
	done_joke()


func _on_idk_pressed():
	player.fall()
	done_joke()

func done_joke():
	$AudioStreamPlayer2.playing = true
	get_tree().paused = false
	hide()
