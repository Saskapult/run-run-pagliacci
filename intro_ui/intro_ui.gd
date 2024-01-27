extends Node2D


signal intro_done

var lines_tween
var dialogue_text = ""
var char_mask = 0


func pag1():
	$SpeakerName.text = "Some Guy:"
	
	dialogue_text = ""
	char_mask = 0
	lines_tween = get_tree().create_tween()
	
	var pag1_lines = [
		"I think I'm depressed. \n",
		"Life seems harsh and cruel. \n",
		"I feel all alone in this threatening world. \n",
		"Chased by a void of fear and uncertainty. \n",
	]
	
	for line in pag1_lines:
		dialogue_text += line
		lines_tween.tween_property(self, "char_mask", dialogue_text.length(), line.length() * 0.01)
		lines_tween.tween_interval(1.0)
	lines_tween.tween_interval(1.0)
	lines_tween.tween_callback(doc1)

func doc1():
	$SpeakerName.text = "Doctor:"
	
	dialogue_text = ""
	char_mask = 0
	lines_tween = get_tree().create_tween()
	
	var doc1_lines = [
		"Ah, this treatment is simple. \n", 
		"Laughter is the best medicine. \n",
		"The great clown Pagliacci is in town. \n",
		"Go see him, he will make you laugh. \n", 
	]
	
	for line in doc1_lines:
		dialogue_text += line
		lines_tween.tween_property(self, "char_mask", dialogue_text.length(), line.length() * 0.01)
		lines_tween.tween_interval(1.0)
	lines_tween.tween_interval(1.0)
	lines_tween.tween_callback(pag2)

func pag2():
	$SpeakerName.text = "Some Guy:"
	
	dialogue_text = ""
	char_mask = 0
	lines_tween = get_tree().create_tween()
	
	var pag1_lines = [
		"But doctor",
		"...    ",
		"I am Pagliacci!",
	]
	
	for line in pag1_lines:
		dialogue_text += line
		lines_tween.tween_property(self, "char_mask", dialogue_text.length(), line.length() * 0.01)
		lines_tween.tween_interval(1.0)
	lines_tween.tween_interval(1.0)
	lines_tween.tween_callback(signal_done)

func signal_done():
	intro_done.emit()


func do_intro():
	pag1()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#print(char_mask)
	#print(dialogue_text.substr(0, char_mask))
	$Dialogue.text = dialogue_text.substr(0, char_mask)
	pass
