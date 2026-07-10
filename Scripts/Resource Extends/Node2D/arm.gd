class_name ArmBase
extends Node2D

@export var arm_components: Array[Resource] = []
@export var arm_activator: Array[InputEventAction]
@export var arm_activation: Resource

@onready var output: Node2D = $"Bullet Output"

func flip_the_arm_by_rotation():
	if cos(rotation) < 0:
		for i in get_children():
			if i is Sprite2D:
				i.flip_v = true
	else:
		for i in get_children():
			if i is Sprite2D:
				i.flip_v = false

func arm_rotate_axis_to_mouse():
	look_at(get_global_mouse_position())

func _process(_delta: float) -> void:
	flip_the_arm_by_rotation()
	arm_rotate_axis_to_mouse()
