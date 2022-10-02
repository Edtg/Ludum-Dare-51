extends Node2D


signal level_end(nextLevel)

export(PackedScene) var nextLevelScene

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_body_entered(body):
	if body.is_in_group("players"):
		body.canMove = false
		emit_signal("level_end", nextLevelScene)
