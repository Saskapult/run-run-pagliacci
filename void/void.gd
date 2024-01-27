extends Node2D

@export var player: Node2D

signal player_in_void


# Called when the node enters the scene tree for the first time.
func _ready():
	$CPUParticles2D.emitting = true
	$AnimatedSprite2D.play("default")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#$Area2D.get_o


func _on_area_2d_body_entered(body):
	if body == player:
		print("Player touched void!")
		player_in_void.emit()
		
