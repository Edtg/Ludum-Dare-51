extends Node2D


var currentLevelScene
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


func ChangeLevel(levelScene):
	$Timer.set_paused(true)
	if is_instance_valid(currentLevel):
		currentLevel.queue_free()
	currentLevelScene = levelScene
	currentLevel = levelScene.instance()
	add_child(currentLevel)
	var levelEnds = get_tree().get_nodes_in_group("level_ends")
	for levelEnd in levelEnds:
		levelEnd.connect("level_end", self, "ChangeLevel")
	var player = get_tree().get_nodes_in_group("players")[0]
	player.connect("death", self, "PlayerDeath")
	
	$Timer.set_paused(false)
	$Timer.start()

func PlayerDeath():
	ChangeLevel(currentLevelScene)
