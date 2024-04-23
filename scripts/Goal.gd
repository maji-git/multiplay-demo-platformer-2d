extends Area2D

@export var scene_to_load = ""

# Called when the node enters the scene tree for the first time.
func _ready():
	body_entered.connect(_body_entered)

func _body_entered(body: Node2D):
	# Ignore if server, load_scene is only callable in the server
	if !MPIO.mpc.is_server:
		return
	
	# If body is player
	if body.is_in_group("player"):
		# Load the scene by path, and respawn player
		MPIO.mpc.load_scene(scene_to_load, true)
