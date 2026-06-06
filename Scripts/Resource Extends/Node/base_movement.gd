class_name BaseMovementNode
extends BaseComponentNode

var input_resource: BaseInputResource = BaseInputResource.new()
var speed: float = 300
var jump_force: float = 100
var input_available: bool = false
var input_buffer: Array[BaseInputResource.Acciones]

signal input_emited(input: BaseInputResource.Acciones)


#region Buffer

var index_buffer: int = 0
var buffer_timer: SceneTreeTimer

func input_buffer_method(new_action: BaseInputResource.Acciones, buffer: Array[BaseInputResource.Acciones] = input_buffer) -> void:
	add_action_to_buffer(new_action)
	if input_available:
		input_emited.emit(buffer[index_buffer])

func timeout_buffer() -> void:
	reset_buffer()

func add_action_to_buffer(new_action: BaseInputResource.Acciones, buffer: Array[BaseInputResource.Acciones] = input_buffer) -> void:
	if new_action != input_resource.Acciones.NONE:
		buffer.append(new_action)
		buffer_timer = get_tree().create_timer(0.399)
		if not buffer_timer.timeout.is_connected(timeout_buffer):
			buffer_timer.timeout.connect(timeout_buffer)

func reset_buffer() -> void:
	buffer_timer.timeout.disconnect(timeout_buffer)
	buffer_timer = null
	index_buffer = 0

#endregion

func call_everything() -> void:
	pass


func _input(_event: InputEvent) -> void:
	pass
