extends Label


@onready var coin_spawner: Node2D = $"../../coin-spawner"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	coin_spawner.super_coin_spawned.connect(_on_supercoin_spawn)
	visible = false

var already_displayed = false


func _on_supercoin_spawn():
	if already_displayed == false:
		visible = true

func _on_coin_picked_up(points, isSuperCoin):
	if isSuperCoin == true:
		already_displayed = true
		visible = false
