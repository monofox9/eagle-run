# scripts/score_manager.gd
extends Node

const SAVE_PATH := "user://save_data.cfg"
const SECTION := "scores"
const KEY := "high_score"

var high_score: int = 0
var current_score: int = 0

func _ready() -> void:
	load_high_score()


# Call this every frame (or on distance tick) from your gameplay scene
func update_score(new_score: int) -> void:
	current_score = new_score


# Call this when the session ends (e.g., on quit or scene change)
func submit_score() -> void:
	if current_score > high_score:
		high_score = current_score
		save_high_score()
	current_score = 0


func load_high_score() -> void:
	var config := ConfigFile.new()
	var err := config.load(SAVE_PATH)
	if err == OK:
		high_score = config.get_value(SECTION, KEY, 0)
	else:
		high_score = 0


func save_high_score() -> void:
	var config := ConfigFile.new()
	config.set_value(SECTION, KEY, high_score)
	config.save(SAVE_PATH)
