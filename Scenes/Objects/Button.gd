extends Node2D


export(Array, NodePath) var connectedDoors


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func press():
	$AudioStreamPlayer2D.play()
	if $Timer.time_left == 0:
		$Sprite.frame = 1
		$Timer.start()
		for door in connectedDoors:
			if is_instance_valid(get_node(door)):
				get_node(door).ToggleOpen()


func _on_Timer_timeout():
	$Sprite.frame = 0
