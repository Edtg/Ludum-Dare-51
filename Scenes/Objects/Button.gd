extends Node2D


export(NodePath) var connectedDoor


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func press():
	if $Timer.time_left == 0:
		$Sprite.frame = 1
		$Timer.start()
		if is_instance_valid(get_node(connectedDoor)):
			get_node(connectedDoor).ToggleOpen()


func _on_Timer_timeout():
	$Sprite.frame = 0
