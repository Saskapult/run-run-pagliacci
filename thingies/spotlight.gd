extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$Label.visible = false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	print("Player in spotlight")
	$Label.visible = true
	body.perform()
