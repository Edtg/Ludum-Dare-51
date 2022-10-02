extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_FadeScreen_FadedIn():
	$Timer.start()


func _on_FadeScreen_FadedOut():
	var enemies = get_tree().get_nodes_in_group("enemies")
	for enemy in enemies:
		enemy.UpdatePosition()
		
	$CanvasLayer/FadeScreen.FadeIn()


func _on_Timer_timeout():
	$CanvasLayer/FadeScreen.FadeOut()
