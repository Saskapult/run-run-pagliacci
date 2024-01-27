extends Node2D



@export var speed = -150
#@export var player: Node2D
var moving = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if moving:
		global_position.x += speed * delta


func _on_hitting_area_body_entered(body):
	print("Hit by cart")
	$RideArea.process_mode = Node.PROCESS_MODE_DISABLED
	body.fall()


func _on_ride_area_body_entered(body):
	print("Ride cart")
	body.ride()
	queue_free()
