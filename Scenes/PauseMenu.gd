extends CanvasLayer


var isPlaying = false
var isPaused = false


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("Pause") and isPlaying:
		if not isPaused:
			isPaused = true
			visible = isPaused
			get_tree().paused = isPaused
		else:
			isPaused = false
			visible = isPaused
			get_tree().paused = isPaused


func _on_PauseResumeButton_pressed():
	isPaused = false
	visible = isPaused
	get_tree().paused = isPaused


func _on_PauseQuitButton_pressed():
	isPlaying = false
	isPaused = false
	visible = isPaused
	get_tree().paused = isPaused
	get_tree().call_group("world", "LoadMainMenu")
