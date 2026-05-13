extends Control

@onready var high_score: Label = $HighScore


func _ready() -> void:
	high_score.text

func _on_play_button_pressed():
	get_tree().change_scene_to_file("res://scenes/game_level.tscn")
