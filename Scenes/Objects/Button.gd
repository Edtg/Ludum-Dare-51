extends Node2D


export(Array, NodePath) var connectedDoors
export(Array, NodePath) var otherConnections
export(bool) var oneShot = false

var canInteract = true


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func Reset():
	canInteract = true

func Press(interactor):
	$AudioStreamPlayer2D.play()
	if $Timer.time_left == 0:
		$Sprite.frame = 1
		$Timer.start()
		if canInteract:
			for door in connectedDoors:
				if is_instance_valid(get_node(door)):
					get_node(door).ToggleOpen()
			
			for connection in otherConnections:
				if is_instance_valid(get_node(connection)):
					get_node(connection).Interact()
			
			if oneShot:
				canInteract = false


func _on_Timer_timeout():
	$Sprite.frame = 0
