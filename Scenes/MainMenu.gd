extends CanvasLayer


export(NodePath) var world


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_PlayButton_pressed():
	get_node(world).ChangeLevel(get_node(world).firstLevel)
	$AudioStreamPlayer.play()
	visible = false


func _on_QuitButton_pressed():
	$AudioStreamPlayer.play()
	get_tree().quit()

