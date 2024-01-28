extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$Label.visible = false


func _on_body_entered(body):
	print("Player in spotlight")
	$Label.visible = true
	body.perform()
