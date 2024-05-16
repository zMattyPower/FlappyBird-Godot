extends Node2D

func _ready():
	set_process(true)
	#Engine.physics_ticks_per_second = 200

func _process(_delta):
	var collision_info = move_platform()
	
func move_platform():
	if Global.isGameStarted:
		position.x -= 1 * 180 * get_process_delta_time()

func _on_area_2d_body_exited(body):
	Global.points += 1
	print(Global.points)
