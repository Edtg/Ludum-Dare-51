extends Control


export(Array, String) var dialogueLines = []
var currentLine = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	get_tree().paused = true
	visible = true
	PlayNextDialogue()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("DialogueContinue"):
		if currentLine < len(dialogueLines):
			PlayNextDialogue()
		else:
			get_tree().paused = false
			visible = false

func PlayNextDialogue():
	var dialogue = dialogueLines[currentLine]
	$WalkieTalkie/SpeechBubble/SpeechLabel.text = dialogue
	currentLine += 1
	$AnimationPlayer.play("Broadcast")
