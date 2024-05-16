class_name Global extends Node

static var player = null
static var points = 0
static var high_score = 0

static var isGameStarted = false
static var isFirstPipe = false

# Called when the node enters the scene tree for the first time.
func _ready():
	spawn()
	
func firstPipe(distance):
	var spawned_scene = load("res://scenes/pipe.tscn")
	var spawned_scene_copy = spawned_scene.instantiate()
	var test2 = get_node("/root/Game/Player").get_position().x + distance
	var rng = RandomNumberGenerator.new()
	var ranNum = rng.randf_range(-50.0, 50.0)
	var test3 = 280 + ranNum 
	spawned_scene_copy.position.x = test2
	spawned_scene_copy.position.y = test3
	add_child(spawned_scene_copy)
	
func spawn():
	#if not isFirstPipe:
	#	firstPipe(220)
	#	firstPipe(440)
	#	isFirstPipe = true
	while true:
		await get_tree().create_timer(0.9).timeout
		if Global.isGameStarted:
			var spawned_scene = load("res://scenes/pipe.tscn")
			var spawned_scene_copy = spawned_scene.instantiate()
			var test2 = get_node("/root/Game/Player").get_position().x + 350
			var rng = RandomNumberGenerator.new()
			var ranNum = rng.randf_range(-50.0, 50.0)
			var test3 = 280 + ranNum 
			spawned_scene_copy.position.x = test2
			spawned_scene_copy.position.y = test3
			add_child(spawned_scene_copy)
