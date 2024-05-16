extends CharacterBody2D

const SPEED = 0.0
const JUMP_VELOCITY = -300.0

@onready var animated_sprite = $AnimatedSprite2D
@onready var timer = $Timer

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func rotate_player():
	animated_sprite.rotation = -120
	timer.start()

func _physics_process(delta):
	# Handle jump.
	if Input.is_action_just_pressed("jump"):
		velocity.y = JUMP_VELOCITY
		if not Global.isGameStarted:
			Global.isGameStarted = true
		rotate_player()
		
	if not Global.isGameStarted:
		return
	
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	var collision_info = move_and_collide(velocity * delta)
	
	if collision_info:
		if (collision_info.get_collider().is_in_group("Pipes")):
			get_tree().reload_current_scene()
			if Global.points > Global.high_score:
				Global.high_score = Global.points
			Global.points = 0
			Global.isGameStarted = false
			Global.isFirstPipe = false
		else:
			animated_sprite.rotation = 0

func _on_timer_timeout():
	animated_sprite.rotation = 120
	
