class_name BaseComponentNode
extends Node

@onready var father: ComponentController = $".."
@onready var grandfather: Node = father.father

func _assembled_component(_target_node: Node):
	pass
