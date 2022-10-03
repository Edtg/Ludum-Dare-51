extends Node2D


var currentInteractor
var canInteract = true

export(Array, NodePath) var connectedDoors


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func Press(interactor):
	if canInteract:
		currentInteractor = interactor
		currentInteractor.canMove = false
		$CanvasLayer/ColourCombo.visible = true


func _on_ColourCombo_completed():
	canInteract = false
	currentInteractor.canMove = true
	for door in connectedDoors:
		if is_instance_valid(get_node(door)):
			get_node(door).ToggleOpen()
