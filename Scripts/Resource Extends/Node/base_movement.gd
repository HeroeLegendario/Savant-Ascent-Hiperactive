class_name BaseMovementComponent
extends BaseComponentNode

var direction: int = 0
var shift_pressed: bool = false
var jump_counter: int = 3
#Para tu propia sanidad, primero pones el estado al que vas a cambiar

#Aqui la logica de los inputs guardados se aplican
var input_resource: BaseInputResource = BaseInputResource.new()
var speed: float = 300.0
var jump_force: float = 100.0
var gravity: float = 3.99
# Puta madre el input buffer que me robe no sirve en mi sistema, este nuevo espero que funcione

var buff_left_action: Buffer = Buffer.new(0.15, 0.15)
var buff_right_action: Buffer = Buffer.new(0.15, 0.15)
var buff_jump_slow_action: Buffer = Buffer.new(0.15, 0.15)
var buff_jump_fast_action: Buffer = Buffer.new(0.15, 0.15)

var player_grandfather: BasePlayer2D

signal state_changed(state_data: Dictionary[String, Variant])

func _identify_grandfather() -> void: #Actualizacion: NO es redundante, lo quite y algo se jodio, no me acuerdo que haga esto, pero es importante #revisando esto veo que es redundante, no se por que hice esto, pero lo hice
	if grandfather is BasePlayer2D:
		player_grandfather = grandfather
	else:
		printerr("ERROR: este componente solo acepta nodos 'BasePlayer2D' o clases que extiendan de el")
		player_grandfather = null
#		Ya descubri que hace esto

#region ifs allows, esto es para los buffers

func if_allow_for_left_and_right() -> bool:
	if player_grandfather.player_state in [player_grandfather.PlayerStates.STAND, player_grandfather.PlayerStates.GRAPPLED]:
		return true
	else:
		return false

func if_allow_for_fast_jump() -> bool:
	if player_grandfather.player_state in [player_grandfather.PlayerStates.STAND] and not shift_pressed:
		return true
	else:
		return false

func if_allow_for_slow_jump() -> bool:
	if player_grandfather.player_state in [player_grandfather.PlayerStates.STAND, player_grandfather.PlayerStates.JUMPING_SLOW] and shift_pressed and jump_counter > 3:
		return true
	elif player_grandfather.player_state in [player_grandfather.PlayerStates.GRAPPLED]:
		return true
	else:
		return false

#endregion

#region los buffers, su actualizacion y ejecutor, junto con el input mal hecho del shift xdd

func update_shift_state() -> void:
	if Input.is_action_pressed(&"sav_input_shift"): #en caso de que este haciendo algo mal o no se detecte correctamente el shift presionado, modificar esta funcion
		shift_pressed = true
	else:
		shift_pressed = false

func updating_buffers(delta: float) -> void: #esto es para actualizar los buffers y verificar si pueden ejecutar sus inputs, esto solo puede estar en process o physics_process, lo mejor es que este en process por que physics_process se ralentiza o detiene y es para ejecutar los movmimiento del juego, pero el input no deberia hacerlo, solo digo...
	buff_left_action.update(Input.is_action_pressed(input_resource.left_action.action),
	if_allow_for_left_and_right(),
	delta)

	buff_right_action.update(Input.is_action_pressed(input_resource.right_action.action),
	if_allow_for_left_and_right(),
	delta)

	buff_jump_fast_action.update(Input.is_action_just_pressed(input_resource.jump_fast_action.action),
	if_allow_for_fast_jump(),
	delta)

	buff_jump_slow_action.update(Input.is_action_just_pressed(input_resource.jump_slow_action.action),
	if_allow_for_slow_jump(),
	delta)

func execute_inputs():
	buffering_in_left_and_right()

#region Logica de los inputs a ejecutar

func buffering_in_left_and_right() -> void:
	if buff_left_action.should_run_action():
		state_changed.emit({state = player_grandfather.PlayerStates.MOVING_TO_ELEVATOR, direction = -1})
	elif buff_right_action.should_run_action():
		state_changed.emit({state = player_grandfather.PlayerStates.MOVING_TO_ELEVATOR, direction = 1})

#endregion

#endregion

func _ready() -> void:
	_identify_grandfather()

func _process(delta: float) -> void:
	updating_buffers(delta)
	update_shift_state()
	execute_inputs()
