# scripts/day_night_manager.gd
extends Node

var is_day: bool = true

const SKY_FAR_DAY   := "res://assets/env/eaglrun-sky-main.png"
const SKY_FAR_NIGHT := "res://assets/env/eaglrun-sky-night.png"
const SKY_NEAR_DAY   := "res://assets/env/eaglerun-rooftops.png"
const SKY_NEAR_NIGHT := "res://assets/env/eaglerun-rooftops-night.png"

func toggle() -> void:
	is_day = !is_day
	_apply()

func _apply() -> void:
	# Find the sprites inside the parallax nodes by group
	var far_sprite  := _get_sprite("sky-far")
	var near_sprite := _get_sprite("sky-near")
	if far_sprite:
		far_sprite.texture = load(SKY_FAR_NIGHT if !is_day else SKY_FAR_DAY)
	if near_sprite:
		near_sprite.texture = load(SKY_NEAR_NIGHT if !is_day else SKY_NEAR_DAY)

func _get_sprite(parallax_name: String) -> Sprite2D:
	# Walk the tree to find the Sprite2D child of the named Parallax2D
	var parallax := _find_node_by_name(get_tree().root, parallax_name)
	if parallax:
		for child in parallax.get_children():
			if child is Sprite2D:
				return child
	return null

func _find_node_by_name(node: Node, target: String) -> Node:
	if node.name == target:
		return node
	for child in node.get_children():
		var result := _find_node_by_name(child, target)
		if result:
			return result
	return null
