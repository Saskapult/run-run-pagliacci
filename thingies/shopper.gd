extends Area2D

@export var cart: Node2D


func _on_body_entered(_body):
	cart.moving = true
