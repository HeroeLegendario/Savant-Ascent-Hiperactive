class_name PropComponentNode
extends BaseComponentNode

@export var enabled: bool = true
@export var custom_data: Dictionary
@export var is_static_prop: bool = false

var pointed_to: Node

func _ready() -> void:
	if not pointed_to:
		printerr("ERROR: POINTED TO VARIABLE NOT ASSIGNED TO THE TARGET NODE")
	if is_static_prop:
		pointed_to.set_process(false)
		pointed_to.set_physics_process(false)

#func _init_prop_state(owner: = pointed_to):
	#pass
#
#func _prop_function(delta: float, owner: = pointed_to):
	#pass
#
#func _exit_prop_state(owner: = pointed_to):
	#pass
