extends Node2D


var time_to_scroll = false
var do_intro = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$Void.visible = false
	if do_intro:
		$IntroUi.do_intro()
	else:
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


func _on_intro_ui_intro_done():
	$Void.visible = true
	time_to_scroll = true
	$StartingCage.process_mode = Node.PROCESS_MODE_DISABLED
	$AudioStreamPlayer.playing = true


var menu = preload("res://restart_ui/restart_ui.tscn")
func _on_void_player_in_void():
	print("Goto fail scene")
	var instance = menu.instantiate()
	get_tree().root.add_child(instance)
	get_tree().root.remove_child(self)

func pause():
	time_to_scroll = false
	$Player.move_enabled = false

func resume():
	time_to_scroll = true
	$Player.move_enabled = true

func end():
	print("end game")
	$Void.visible = false
	time_to_scroll = false
	$AudioStreamPlayer.playing = false

