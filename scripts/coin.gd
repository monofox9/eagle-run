extends Area2D

signal on_pickup(points, isSuperCoin)

@export var speed: float = 200.0

var isSuperCoin
var points = 0

func _ready():
	if is_in_group("super_coin"):
		points = 5
		isSuperCoin = true
	else:
		points = 1

func _physics_process(delta):
	position.x -= speed * delta

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		emit_signal("on_pickup", points, isSuperCoin)
		queue_free()

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
	

	
