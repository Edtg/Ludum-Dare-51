extends Node2D


export(NodePath) var stabilisers


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



func Interact():
	if get_node(stabilisers).enabledCount < 0:
		$AnimationPlayer.play("GameFailed")
	else:
		$AnimationPlayer.play("GameCompleted")
		get_tree().paused = true


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "GameCompleted":
		get_tree().paused = false
		get_tree().call_group("world", "LoadMainMenu")
	elif anim_name == "GameFailed":
		$Player.Die()
		$AnimationPlayer.play("RESET")
