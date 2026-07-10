class_name BasePlayer2D
extends CharacterBody2D

const DEFAULT_FOLDER: String = "res://DEFAULT/"
const DEFAULT_LIVES: int = 3
const MAX_LIVES: int = 5 #La cantidad de vidas que el jugador puede mantener, este valor es temporal, en el futuro el jugador podra annadirse vidas infinitamente
const MOVEMENT_TIME: int = 1

enum PlayerStates {STAND = 0, STAND_ATTACKING, MOVING_TO_ELEVATOR, ATTACKING_ON_AIR, ROLLING, JUMPING_SLOW, JUMPING_FAST, FALLING, GRAPPLING_ON_AIR, GRAPPLED, GRAPPLING_CD, DEATH_NORMAL, DEATH_FALLING, DANCING_IN_THE_DARK, BEING_COMMUNIST}

#region Exports

@export_category("Switches")
@export var hit_stop: bool = false # Cuando recibe un ataque o cuando ataque a un enemigo muy fuerte se hace un efecto hit_stop

#@export_category("Movement")# es posible que estos valores desaparescan en el futuro
#@export var initial_elevator_index: int = 0 # el jugador al inicio del juego se colocara en el elevador con este indice de array
#@export var elevator_position_per_index: int # esto subira o bajara hasta el infinito, el nivel analizara este valor automaticamente para

@export_category("Custom Components")
@export var movement_component: BaseMovementComponent = BaseMovementComponent.new()
@export var attack_component: BaseAttackResource = BaseAttackResource.new()
@export var live_component: BaseLiveResource = BaseLiveResource.new()

@export_category("Powers and Items")
@export var default_powers: Array[BasePowerResource] = [] #Los poderes que ya tiene desde el inicio se annadiran de forma automatica al inventario
@export var inventory_powers: Array[BasePowerResource] = [] #Los poderes que tiene el personaje
@export var default_items: Array[BaseItemResource] = [] #Los poderes que ya tiene desde el inicio se annadiran de forma automatica al inventario
@export var inventory_items: Array[BaseItemResource] = [] #Los poderes que tiene el personaje

#endregion

#region Internal variables

@onready var arm: ArmBase = $Arm
var actual_elevator: BaseElevator2D = null
var index_in_the_global_array_of_elevators: int = -2
var actual_level: LevelNode = null
var integer_lives: int #usa esto como parte del sistema de vidas si no tienes un sistema de vidas propio puesto

@export_category("Debug, please, remove the export of the variables of below, cuz these doesn't have to being modified")
@export var player_state: PlayerStates = PlayerStates.STAND #the default variable for this is: "PlayerStates.STAND" just copy n paste

#endregion

#region funciones

func get_ready():
	if owner is LevelNode:
		actual_level = get_owner()
	get_spawn_elevator()
	movement_component.state_changed.connect(_on_state_changed)
	get_elevator_index_in_level_array()

func _ready() -> void:
	get_ready()

func _physics_process(_delta: float) -> void:
	if not is_on_floor():
		velocity.y += movement_component.gravity
	else:
		velocity.y = 0
	move_and_slide()

func _on_state_changed(state_data: Dictionary) -> void:
	if state_data.has("state"):
		match state_data.state:
			PlayerStates.STAND:
				pass
			PlayerStates.STAND_ATTACKING:
				pass
			PlayerStates.MOVING_TO_ELEVATOR:
				if state_data.has("direction"):
					sign_for_moving_elevator(state_data.direction)
			PlayerStates.ATTACKING_ON_AIR:
				pass
			PlayerStates.ROLLING:
				pass
			PlayerStates.JUMPING_SLOW:
				pass
			PlayerStates.JUMPING_FAST:
				pass
			PlayerStates.FALLING:
				pass
			PlayerStates.GRAPPLING_ON_AIR:
				pass
			PlayerStates.GRAPPLED:
				pass
			PlayerStates.GRAPPLING_CD:
				pass
			PlayerStates.DEATH_NORMAL:
				pass
			PlayerStates.DEATH_FALLING:
				pass
			PlayerStates.DANCING_IN_THE_DARK:
				pass
			_:
				pass

#region Funciones para la sennal de cambiar estado del jugador

func sign_for_moving_elevator(direction: int) -> void:
	player_state = PlayerStates.MOVING_TO_ELEVATOR

	var objetive_elevator: BaseElevator2D = actual_level.elevator_manager.send_elevator_by_direction(actual_elevator, direction)
	var tween: Tween = get_tree().create_tween()

	tween.tween_property(self, ^"position", objetive_elevator.player_step_floor.global_position, MOVEMENT_TIME)

#endregion

#region Obtener el elevador de spawn

func get_spawn_elevator() -> void: #solo poner esto en ._ready
	if actual_level.player_spawn_elevator != null:
		actual_elevator = actual_level.player_spawn_elevator

func get_elevator_index_in_level_array():
	await actual_level.elevator_manager.elevator_ended_indexing
	if actual_level.elevator_manager.manager_resource.elevator_array != []:
		index_in_the_global_array_of_elevators = actual_level.elevator_manager.manager_resource.elevator_array.find(actual_elevator)
	elif index_in_the_global_array_of_elevators == -2:
		await get_tree().create_timer(0.399).timeout
		get_elevator_index_in_level_array()

#endregion

#endregion
