extends TextureButton

@onready var pause_menu: Control = %GameMenu

func _on_pressed() -> void:
	pause_menu.visible = true
	get_tree().paused = true
