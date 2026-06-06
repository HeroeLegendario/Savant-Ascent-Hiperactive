class_name BasePlayer2D
extends CharacterBody2D

const DEFAULT_FOLDER: String = "res://DEFAULT/"
const DEFAULT_LIVES: int = 3
const MAX_LIVES: int = 5 #La cantidad de vidas que el jugador puede mantener, este valor es temporal, en el futuro el jugador podra annadirse vidas infinitamente

#region Exports

@export_category("Switches")
@export var hit_stop: bool = false # Cuando recibe un ataque o cuando ataque a un enemigo muy fuerte se hace un efecto hit_stop

@export_category("Movement")# es posible que estos valores desaparescan en el futuro
@export var initial_elevator_index: int = 0 # el jugador al inicio del juego se colocara en el elevador con este indice de array
@export var elevator_position_per_index: int # esto subira o bajara hasta el infinito, el nivel analizara este valor automaticamente para

@export_category("Custom Components")
@export var movement_node: BaseMovementNode = BaseMovementNode.new()
@export var attack_resource: BaseAttackResource = BaseAttackResource.new()
@export var live_resource: BaseLiveResource = BaseLiveResource.new()

@export_category("Powers and Items")
@export var default_powers: Array[BasePowerResource] = [] #Los poderes que ya tiene desde el inicio se annadiran de forma automatica al inventario
@export var inventory_powers: Array[BasePowerResource] = [] #Los poderes que tiene el personaje
@export var default_items: Array[BaseItemResource] = [] #Los poderes que ya tiene desde el inicio se annadiran de forma automatica al inventario
@export var inventory_items: Array[BaseItemResource] = [] #Los poderes que tiene el personaje

#endregion

#region Internal variables

@onready var arm: ArmBase = $Arm
var next_elevator: BaseElevator2D = null
var prior_elevator: BaseElevator2D = null
var integer_lives: int

#endregion

#region funciones

func _ready() -> void:
	movement_node.input_emited.connect(_on_input_emited)

func _on_input_emited(input: BaseInputResource.Acciones):
	match input:
		0:
			pass
		1:
			print("izquierda") #annadirr la logica del movimiento hacia la izquierda
		2:
			print("derecha") #annadirr la logica del movimiento hacia la derecha


func get_elevators(_elevators: Array[BaseElevator2D]):
	pass

#endregion
