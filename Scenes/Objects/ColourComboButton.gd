extends Node2D


var currentInteractor
var canInteract = true

export(Array, String, "Red", "Yellow", "Blue", "Green") var sequence = ["", "", "", ""]
export(Array, NodePath) var connectedDoors
export(Array, NodePath) var otherConnections
export(bool) var oneShot = true


# Called when the node enters the scene tree for the first time.
func _ready():
	$CanvasLayer/ColourCombo.sequence = sequence
	$CanvasLayer/ColourCombo.UpdateNote()


func Reset():
	canInteract = true
	if is_instance_valid(currentInteractor):
		currentInteractor.canMove = true
	$CanvasLayer/ColourCombo.Reset()
	

func Press(interactor):
	if canInteract:
		currentInteractor = interactor
		currentInteractor.canMove = false
		$CanvasLayer/ColourCombo.visible = true


func _on_ColourCombo_completed():
	if oneShot:
		canInteract = false
	
	currentInteractor.canMove = true
	
	for door in connectedDoors:
		if is_instance_valid(get_node(door)):
			get_node(door).ToggleOpen()
			
	for connection in otherConnections:
				if is_instance_valid(get_node(connection)):
					get_node(connection).Interact()
