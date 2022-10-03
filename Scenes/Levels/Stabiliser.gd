extends Node2D


var enabledCount = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	Reset()

func Reset():
	enabledCount = 0

func Interact():
	enabledCount += 1
