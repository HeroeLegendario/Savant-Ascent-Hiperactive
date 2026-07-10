class_name BaseInputResource
extends Resource

#Aqui se guardaran los inputs

enum Acciones {NONE = 0, LEFT, RIGHT, JUMP_FAST, JUMP_SLOW, HOOK, ROLL, ATTACK, SPECIAL, _sneak, _grab_border}
#acciones futuras: agacharse, agarrarse a la saliente del elevador

@export var left_action: InputEventAction = InputEventAction.new()
@export var right_action: InputEventAction = InputEventAction.new()
@export var jump_slow_action: InputEventAction = InputEventAction.new()
@export var jump_fast_action: InputEventAction = InputEventAction.new()
@export var hook_action: InputEventAction = InputEventAction.new()
@export var roll_action: InputEventAction = InputEventAction.new()
@export var attack_action: InputEventAction = InputEventAction.new()
@export var special_action: InputEventAction = InputEventAction.new()

var sneak: InputEventAction = InputEventAction.new() #separados de los demas por ser acciones futuras
var grab_border:InputEventAction = InputEventAction.new()


var all_actions: Array[StringName]


func get_all_sav_actions():
	var every_actions: Array[StringName] = InputMap.get_actions()
	for index in every_actions:
		if str(index).begins_with("sav_"):
			all_actions.append(index)

#region Controles

func get_left_n_right_input() -> Acciones:
	var direction: int
	if InputBufferNode.is_action_press_buffered(left_action.action):
		direction = -1
	elif InputBufferNode.is_action_press_buffered(right_action.action):
		direction = 1
	else:
		direction = 0

	if direction > 0:
		return Acciones.LEFT
	elif direction < 0:
		return Acciones.RIGHT
	else:
		return Acciones.NONE

func get_fast_jump_pressed() -> Acciones:
	if not InputBufferNode.is_action_press_buffered(jump_slow_action.action):
		if InputBufferNode.is_action_press_buffered(jump_fast_action.action):
			return Acciones.JUMP_FAST
		else:
			return Acciones.NONE
	else:
		return Acciones.NONE

func get_slow_jump_pressed() -> Acciones:
	if InputBufferNode.is_action_press_buffered(jump_slow_action.action):
		return Acciones.JUMP_SLOW
	else:
		return Acciones.NONE

#endregion

func all_inputs() -> Array[Acciones]: #Esta perra mamada que we XDxdXd
	var arr: Array[Acciones] = []
	var actual_action: Acciones
	actual_action = get_left_n_right_input()
	if actual_action != 0:
		arr.append(get_left_n_right_input())
	actual_action = get_fast_jump_pressed()
	if actual_action != 0:
		arr.append(get_fast_jump_pressed())
	actual_action = get_slow_jump_pressed()
	if actual_action != 0:
		arr.append(get_slow_jump_pressed())
	return arr

func map_all_actions_to_default(to_default: bool = true):
	if to_default:
		get_all_sav_actions()
		left_action.action = all_actions[0]
		right_action.action = all_actions[1]
		jump_fast_action.action = all_actions[2]
		jump_slow_action.action = all_actions[3]

func _init() -> void:
	map_all_actions_to_default()
