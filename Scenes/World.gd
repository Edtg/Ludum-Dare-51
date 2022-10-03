extends Node2D


var currentLevel
export(PackedScene) var firstLevel

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


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
	$Timer/ElectricitySound.play()


func ChangeLevel(levelScene):
	$Timer.set_paused(true)
	if is_instance_valid(currentLevel):
		currentLevel.queue_free()
	currentLevel = levelScene.instance()
	#add_child(currentLevel)
	call_deferred("add_child", currentLevel)
	
	$Timer.set_paused(false)
	$Timer.start()

func ResetLevel():
	print("Resetting")
	var player = get_tree().get_nodes_in_group("players")[0]
	player.Reset()
	
	get_tree().call_group("enemies", "Reset")
	get_tree().call_group("doors", "Reset")
	
	$Timer.start()


func _on_Player_death():
	ResetLevel()
