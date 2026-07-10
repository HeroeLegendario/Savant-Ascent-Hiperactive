class_name PropComponentNode
extends BaseComponentNode

@export var custom_data: Dictionary
@export var is_static_prop: bool = false

func _ready() -> void:
	if is_static_prop:
		grandfather.set_process(false)
		grandfather.set_physics_process(false)

#func _init_prop_state(owner: Node = grandfather):
	#pass
#
#Put this in process if it not a static prop
#func _prop_function(delta: float, owner: Node = grandfather):
	#pass
#
#func _exit_prop_state(owner: Node = grandfather):
	#pass
