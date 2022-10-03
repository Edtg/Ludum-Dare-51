extends KinematicBody2D


export(float) var speed = 0.5
export(float) var sprintSpeed = 0.8
var canMove = true
var isDead = false

var interactionObject

onready var startPos = global_position

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func Reset():
	global_position = startPos
	canMove = true
	isDead = false
	$Sprite.frame = 0

func _physics_process(delta):
	if isDead:
		return
	
	var velocity = Vector2(0,0)
	var moveSpeed = speed
	
	if Input.is_action_pressed("MoveUp"):
		velocity.y -= 1
		$CollisionShape2D.rotation_degrees = 0
		$Sprite.rotation_degrees = 0
	if Input.is_action_pressed("MoveDown"):
		velocity.y += 1
		$CollisionShape2D.rotation_degrees = 0
		$Sprite.rotation_degrees = 180
	if Input.is_action_pressed("MoveLeft"):
		velocity.x -= 1
		$CollisionShape2D.rotation_degrees = 90
		$Sprite.rotation_degrees = 270
	if Input.is_action_pressed("MoveRight"):
		velocity.x += 1
		$CollisionShape2D.rotation_degrees = 90
		$Sprite.rotation_degrees = 90
	
	if canMove:
		if velocity != Vector2(0,0):
			$AnimationPlayer.play("Walking")
		else:
			$AnimationPlayer.play("Idle")
		move_and_collide(velocity.normalized() * moveSpeed)
	else:
		$AnimationPlayer.play("Idle")
	
	
	if Input.is_action_just_pressed("Interact") and is_instance_valid(interactionObject):
		interactionObject.Press(self)



func _on_InteractionArea_area_entered(area):
	var object = area.get_parent()
	if object.is_in_group("interactables"):
		interactionObject = object


func _on_InteractionArea_area_exited(area):
	var object = area.get_parent()
	if interactionObject == object:
		interactionObject = null

func Die():
	isDead = true
	$AnimationPlayer.play("Death")


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "Death":
		get_tree().call_group("world", "ResetLevel")
