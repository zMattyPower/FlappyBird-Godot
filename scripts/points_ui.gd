class_name points_ui extends Control

@onready var label = $Label
@onready var label2 = $Label2
@onready var high_score = $HighScore

func _process(delta):
	label2.text = str(Global.points)
	high_score.text = "High Score: " + str(Global.high_score)
	if Global.isGameStarted:
		label.visible = false
		label2.visible = true
		high_score.visible = false
	else:
		label.visible = true
		label2.visible = false
		high_score.visible = true
	
func _ready():
	label2.visible = false
