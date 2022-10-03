extends Control


signal completed

export(Array, String, "Red", "Yellow", "Blue", "Green") var sequence = []
var enteredSequence = []


# Called when the node enters the scene tree for the first time.
func _ready():
	var noteText = ""
	for colour in sequence:
		noteText += colour + "\n"
	$Background/Note/NoteText.text = noteText


func CheckSequence():
	if len(enteredSequence) > len(sequence):
		return
	
	for i in range(len(enteredSequence)):
		if enteredSequence[i] == sequence[i]:
			continue
		else:
			enteredSequence = []
			$Background/SequenceLabel.text = ""
			return
	
	if len(enteredSequence) == len(sequence):
		emit_signal("completed")
		visible = false


func _on_RedButton_pressed():
	enteredSequence.append("Red")
	$Background/SequenceLabel.text += "R"
	CheckSequence()


func _on_YellowButton_pressed():
	enteredSequence.append("Yellow")
	$Background/SequenceLabel.text += "Y"
	CheckSequence()


func _on_BlueButton_pressed():
	enteredSequence.append("Blue")
	$Background/SequenceLabel.text += "B"
	CheckSequence()


func _on_GreenButton_pressed():
	enteredSequence.append("Green")
	$Background/SequenceLabel.text += "G"
	CheckSequence()


func _on_RedButton_mouse_entered():
	$Background/HoveredLabel.text = "R"
	$Background/HoveredLabel.add_color_override("font_color", Color(1,0,0))


func _on_YellowButton_mouse_entered():
	$Background/HoveredLabel.text = "Y"
	$Background/HoveredLabel.add_color_override("font_color", Color(1,1,0))


func _on_BlueButton_mouse_entered():
	$Background/HoveredLabel.text = "B"
	$Background/HoveredLabel.add_color_override("font_color", Color(0,0.5,1))


func _on_GreenButton_mouse_entered():
	$Background/HoveredLabel.text = "G"
	$Background/HoveredLabel.add_color_override("font_color", Color(0,1,0))
