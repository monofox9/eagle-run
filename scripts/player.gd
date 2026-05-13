extends CharacterBody2D

signal clicked # @maynotuse

@export var speed: float = 400.0
@export var acceleration: float = 8.0
@export var stop_threshold: float = 4.0

var target_y: float

func _ready():
	target_y = global_position.y

func _input(event):
	if event is InputEventMouseButton and event.pressed:
		#Emit signal @maynotuse
		emit_signal("clicked")
		
		target_y = get_global_mouse_position().y
		
		# Clamp target so player never tries to go off screen
		var screen_height = get_viewport_rect().size.y
		target_y = clamp(target_y, 0.0, screen_height)

func _physics_process(delta):
	var distance = target_y - global_position.y
	var direction = 0.0

	if abs(distance) > stop_threshold:
		direction = sign(distance)
	else:
		direction = 0.0

	# Smooth acceleration/deceleration
	var target_velocity_y = direction * speed
	velocity.y = lerp(velocity.y, target_velocity_y, acceleration * delta)

	# Lock horizontal movement
	velocity.x = 0.0

	move_and_slide()
