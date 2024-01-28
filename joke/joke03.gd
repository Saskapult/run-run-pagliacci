extends Control


@export var player: Node2D

func _ready():
	hide()


func do_joke():
	show()
	get_tree().paused = true
	$HBoxContainer/Penguin.visible = false
	$HBoxContainer/Robin.visible = false
	var tween = get_tree().create_tween()
	tween.set_pause_mode(Tween.TWEEN_PAUSE_PROCESS)
	tween.tween_interval(0.25)
	tween.tween_callback(func show1(): $HBoxContainer/Penguin.visible = true)
	tween.tween_interval(0.25)
	tween.tween_callback(func show1(): $HBoxContainer/Robin.visible = true)


func _on_fox_pressed():
	# penguin
	done_joke()


func _on_other_pressed():
	player.fall()
	done_joke()

func done_joke():
	get_tree().paused = false
	hide()
