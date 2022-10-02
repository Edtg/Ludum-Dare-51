extends Node2D


var isOpen = false
export(NodePath) var navigationPolygon

# Called when the node enters the scene tree for the first time.
func _ready():
	if is_instance_valid(get_node(navigationPolygon)):
		get_node(navigationPolygon).enabled = isOpen


func ToggleOpen():
	if isOpen:
		CloseDoor()
	else:
		OpenDoor()
	
	isOpen = not isOpen

func OpenDoor():
	if not $AnimationPlayer.is_playing():
		$AnimationPlayer.play("DoorOpen")
		get_node(navigationPolygon).enabled = true

func CloseDoor():
	if not $AnimationPlayer.is_playing():
		$AnimationPlayer.play("DoorClose")
		get_node(navigationPolygon).enabled = false


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "DoorClose":
		$AudioStreamPlayer2D.play()
