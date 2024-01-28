extends Node2D

@export var player: Node2D


func _on_area_2d_body_entered(_body):
	# If is player, signal tripped on banana? 
	print("player on banana")
	player.fall()
	pass # Replace with function body.
