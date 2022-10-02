extends KinematicBody2D

export(int) var speed = 1
var canMove = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	var velocity = Vector2(0,0)
	
	if Input.is_action_pressed("MoveUp"):
		velocity.y -= 1
	if Input.is_action_pressed("MoveDown"):
		velocity.y += 1
	if Input.is_action_pressed("MoveLeft"):
		velocity.x -= 1
	if Input.is_action_pressed("MoveRight"):
		velocity.x += 1
	
	if canMove:
		move_and_collide(velocity * speed)

