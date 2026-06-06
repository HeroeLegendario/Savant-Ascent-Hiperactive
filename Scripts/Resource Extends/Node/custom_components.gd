class_name ComponentController
extends Node

@export var standalone_nodes: Array[BaseComponentNode]

@onready var father: Node = $".."
@onready var father_property = father.get_property_list()

func instanciate_all_father_property_components() -> void:
	for index in father_property:
		if index.usage & PROPERTY_USAGE_SCRIPT_VARIABLE:
			var filter = father.get(index.name)
			if filter is BaseComponentNode:
				add_child(filter)
				filter._assembled_component(father)

func assemble_standalone_nodes():
	for index in standalone_nodes:
		if index is BaseComponentNode:
			index._assembled_component(father)

func assemble_everything():
	instanciate_all_father_property_components()
	assemble_standalone_nodes()

func _ready() -> void:
	assemble_everything()
