extends Node2D


var time_to_scroll = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$Void.visible = false
	#$IntroUi.do_intro()
	_on_intro_ui_intro_done()
	pass # Replace with function body.


func move_camera_if_player_near_edge():
	var viewport_right = $Camera2D.offset.x + 320 / 2
	#print("viewpoert right, ", viewport_right)
	var player_to_right = viewport_right - $Player.global_position.x
	#print("player to right, ", player_to_right)
	if player_to_right < 100:
		$Camera2D.offset.x += 100 - player_to_right

func update_void_position():
	$Void.global_position.x = $Camera2D.offset.x - 320 / 2


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta): 
	move_camera_if_player_near_edge()
	update_void_position()
	if time_to_scroll:
		$Camera2D.offset.x += 1
	pass


func _on_intro_ui_intro_done():
	$Void.visible = true
	time_to_scroll = true
	$StartingCage.process_mode = Node.PROCESS_MODE_DISABLED
	#$IntroUi.visible = false
	pass # Replace with function body.


