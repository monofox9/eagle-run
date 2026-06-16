extends Button

func _ready() -> void:
	_update_label()

func _on_pressed() -> void:
	DayNightManager.toggle()
	_update_label()

func _update_label() -> void:
	text = "Switch to Night" if DayNightManager.is_day else "Switch to Day"
