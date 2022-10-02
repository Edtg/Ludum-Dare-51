extends KinematicBody2D

export(float) var speed = 0.5
export(float) var sprintSpeed = 0.8
var canMove = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	var velocity = Vector2(0,0)
	var moveSpeed = speed
	
	if Input.is_action_pressed("MoveUp"):
		velocity.y -= 1
		$Sprite.flip_v = false
		$Sprite.rotation_degrees = 0
	if Input.is_action_pressed("MoveDown"):
		velocity.y += 1
		$Sprite.flip_v = true
		$Sprite.rotation_degrees = 0
	if Input.is_action_pressed("MoveLeft"):
		velocity.x -= 1
		$Sprite.flip_v = true
		$Sprite.rotation_degrees = 90
	if Input.is_action_pressed("MoveRight"):
		velocity.x += 1
		$Sprite.flip_v = false
		$Sprite.rotation_degrees = 90
	
	if Input.is_action_pressed("Sprint"):
		moveSpeed = sprintSpeed
		$Sprite.speed_scale = 1.5
	else:
		$Sprite.speed_scale = 1
	
	if canMove:
		if velocity != Vector2(0,0):
			$Sprite.playing = true
		else:
			$Sprite.playing = false
			$Sprite.frame = 0
		move_and_collide(velocity * moveSpeed)

