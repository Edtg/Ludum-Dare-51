extends Node2D


var isOpen = false
onready var navigationPoly = get_parent()

# Called when the node enters the scene tree for the first time.
func _ready():
	navigationPoly.enabled = isOpen


func ToggleOpen():
	if isOpen:
		CloseDoor()
	else:
		OpenDoor()
	
	isOpen = not isOpen

func OpenDoor():
	if not $AnimationPlayer.is_playing():
		$AnimationPlayer.play("DoorOpen")
		navigationPoly.enabled = true

func CloseDoor():
	if not $AnimationPlayer.is_playing():
		$AnimationPlayer.play("DoorClose")
		navigationPoly.enabled = false


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "DoorClose":
		$AudioStreamPlayer2D.play()
