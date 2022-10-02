extends Control

onready var _timer = $Timer as Timer
onready var _points_label = $PointLabel as Label

var _points := 0


func _on_Dialog_dialogic_signal(value):
	match value:
		"start_timer":
			_timer.start()
		"stop_timer":
			_timer.stop()
		"point_get":
			_points += 1
			_points_label.text = "Points: %d" % _points
		"reset":
			_points = 0
		"play":
			$AudioStreamPlayer2D.playing = true
			$AudioStreamPlayer2D2.playing = false
		"stop":
			$AudioStreamPlayer2D.playing = false
			$AudioStreamPlayer2D2.playing = true
		"end":
			get_tree().quit()
		"duck":
			$Duck.visible = true
		"blep":
			$Duck.visible = false
	

func _on_Timer_timeout():
	Dialogic.change_timeline("oldage")
