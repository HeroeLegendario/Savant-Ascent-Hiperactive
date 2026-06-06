class_name ArmBase
extends Node2D

@export var arm_components: Array[Resource] = []
@export var arm_activator: Array[InputEventAction]
@export var arm_activation: Resource

@onready var output: Node2D = $"Bullet Output"

func _process(_delta: float) -> void:
	if cos(rotation) < 0:
		for i in get_children():
			if i is Sprite2D:
				i.flip_v = true
	else:
		for i in get_children():
			if i is Sprite2D:
				i.flip_v = false
	rotation_degrees += 1
