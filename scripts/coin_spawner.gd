# CoinSpawner.gd
extends Node2D

#using DND style DC roll to determine coin type
@export var super_coin_DC = 15

@export var coin_scene: PackedScene
@export var min_y: float = 100.0
@export var max_y: float = 500.0


signal super_coin_spawned

const COIN = preload("uid://451fs0o664v")
const SUPERCOIN = preload("uid://c1pxrv2jebkgb")

@onready var score: Label = $"../ui/score"
@onready var coin_instructions: Label = $"../ui/coin_instructions"





func _ready():
	randomize()


func _on_timer_timeout():
	
	var roll = randi_range(1,20)
	print(roll)
	var coin
	
	
	if roll < super_coin_DC:
		coin = COIN.instantiate()
	else:
		coin = SUPERCOIN.instantiate()
		super_coin_spawned.emit()

	var screen_width = get_viewport_rect().size.x
	var y = randf_range(min_y, max_y)

	coin.position = Vector2(screen_width + 50, y)
	get_tree().current_scene.add_child(coin)
	coin.on_pickup.connect(score._on_coin_picked_up)
	coin.on_pickup.connect(coin_instructions._on_coin_picked_up)
