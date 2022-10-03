extends KinematicBody2D


export var pathToPlayer = NodePath()
export var maxDistanceTravel = 80

onready var player = get_tree().get_nodes_in_group("players")[0]
onready var agent = $NavigationAgent2D
onready var startPos = global_position

var hasDetectedPlayer = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


func Reset():
	global_position = startPos
	hasDetectedPlayer = false

func UpdatePosition():
	if not is_instance_valid(player):
		player = get_tree().get_nodes_in_group("players")[0]
	
	agent.set_target_location(player.global_position)
	agent.get_next_location()
	
	if not agent.is_target_reachable() or not hasDetectedPlayer:
		return
	
	var points = agent.get_nav_path()
	var pointIndex = 0
	
	var distanceTravelled = 0
	var currentPosition = global_position
	
	
	while distanceTravelled < maxDistanceTravel and pointIndex < len(points):
		var nextPoint = points[pointIndex]
		pointIndex += 1
		var distance = currentPosition.distance_to(nextPoint)
		if distance < maxDistanceTravel - distanceTravelled:
			currentPosition = nextPoint
			distanceTravelled += distance
		else:
			var direction = currentPosition.direction_to(nextPoint)
			currentPosition += direction * (maxDistanceTravel - distanceTravelled)
			distanceTravelled = maxDistanceTravel
		global_position = currentPosition


func _on_DeathBox_body_entered(body):
	if body.is_in_group("players"):
		body.Die()


func _on_DetectionArea_body_entered(body):
	if body.is_in_group("players"):
		hasDetectedPlayer = true
