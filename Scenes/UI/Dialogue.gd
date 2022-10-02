extends Control


export(Array, String) var dialogueLines = []
var currentLine = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func PlayNextDialogue():
	var dialogue = dialogueLines[currentLine]
	currentLine += 1
	$AnimationPlayer.play("Broadcast")
