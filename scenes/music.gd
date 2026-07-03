extends AudioStreamPlayer

const DAY_THEME = preload("uid://buodvwtpc1gc2")
const NIGHT_THEME = preload("uid://wcqktymhm4cg")


func _ready() -> void:
	DayNightManager.time_of_day.connect(_on_time_of_day_changed)


func _on_time_of_day_changed(day_night):
	if day_night == "night":
		stream = NIGHT_THEME
	else:
		stream = DAY_THEME
	play()
