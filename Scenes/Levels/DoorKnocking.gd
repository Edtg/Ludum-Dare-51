extends AudioStreamPlayer2D


export(bool) var isPaused = false


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():
	$Timer.wait_time = rand_range(0.5, 2)
	if not isPaused:
		play()
