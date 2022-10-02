extends Control

signal FadedOut
signal FadedIn

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func FadeOut():
	$AnimationPlayer.play("FadeOut")


func FadeIn():
	$AnimationPlayer.play("FadeIn")


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "FadeOut":
		emit_signal("FadedOut")
	elif anim_name == "FadeIn":
		emit_signal("FadedIn")
