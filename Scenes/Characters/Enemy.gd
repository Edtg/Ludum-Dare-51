extends KinematicBody2D


export var pathToPlayer = NodePath()
export var maxDistanceTravel = 50

onready var player = get_tree().get_nodes_in_group("players")[0]
onready var agent = $NavigationAgent2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


func UpdatePosition():
	agent.set_target_location(player.global_position)
	agent.get_next_location()
	
	if not agent.is_target_reachable():
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
