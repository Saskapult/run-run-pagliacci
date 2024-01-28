extends Area2D


@export var joke: Control

func _on_body_entered(_body):
	print("Player powerup")
	$AnimatedSprite2D.frame = 2
	var tween = get_tree().create_tween()
	tween.tween_interval(0.25)
	tween.tween_callback(doit)
	
func doit():
	print("UI thing?")
	joke.do_joke()
	queue_free()
