extends CharacterBody2D


const SPEED = 200.0
const JUMP_VELOCITY = -300.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


# Powerdown or banana or something
var fallen = false
func fall():
	fallen = true
	var tween = get_tree().create_tween()
	tween.tween_interval(1.0)
	tween.tween_callback(unfall)
func unfall():
	fallen = false


func update_animations():
	if not fallen:
		if is_on_floor():
			if velocity.length_squared() > 0.01:
				$AnimatedSprite2D.play("run")
			else:
				$AnimatedSprite2D.play("default")
		else:
			$AnimatedSprite2D.play("jump")
	else: 
		$AnimatedSprite2D.play("fall")

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		if velocity.y < -200 and Input.is_action_pressed("ui_accept"):
			velocity.y += gravity * delta * 0.25
		else:
			velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction and not fallen:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	update_animations()
	move_and_slide()
