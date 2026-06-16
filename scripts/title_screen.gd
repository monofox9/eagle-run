extends Control

@onready var high_score: Label = $HighScore


func _ready() -> void:
	var hs := ScoreManager.high_score
	if hs > 0:
		high_score.text = "High Score: %d " % hs
	else:
		high_score.text = "High Score: 0"	

func _on_play_button_pressed():
	get_tree().change_scene_to_file("res://scenes/game_level.tscn")
