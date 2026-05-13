extends Button

@onready var game_menu: Control = $"../.."

func _on_pressed() -> void:
	game_menu.visible = false
	get_tree().paused = false
