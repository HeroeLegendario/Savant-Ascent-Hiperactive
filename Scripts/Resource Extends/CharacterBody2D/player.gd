extends CharacterBody2D
class_name BasePlayer2D

const MIN_ELEVATORS: int = 1 # Siempre deberia haber un elevador si no hay elevadores muere inmediatamente
const MAX_ELEVATORS: int = 100
const FOLDER_OF_DEFAULT: String = "res://DEFAULT/"
const DEFAULT_LIVES: int = 3
const MAX_LIVES: int = 5
const STAMINA_EXPEND: int = 20
const MANA_EXPEND: int = 10

#region Exports

@export_category("Switches")
@export var have_stamina: bool = false
@export var have_mana: bool = false
@export var hit_stop: bool = false # Cuando recibe un ataque o cuando ataque a un enemigo muy fuerte se hace un efecto hit_stop
@export var have_personalized_attack: bool = false # Esto es un switch para usar un ataque personalizado en lugar del por defecto el cual es una copia del ataque inicial de Savant Ascent
@export var have_personalized_lives: bool = false # Las vidas personalizadas son basicamente para que el personaje tenga diferentes efectos dependiendo de que vidas tengan si es falso usara un entero local del personaje cuyo sistema de vidas seran similar al modo historia de savant ascent remix en dificultad media
@export var have_personalized_movement: bool = false # Esto es para cambiar el tipo de movimiento que recorrera el personaje al moverse o saltar, si esta desactivado usara el movimiento del savant ascent original: el salto es en forma de triangulo y su movimiento es recto al cambiar de plataformas
@export var have_personalized_skin: bool = false # Si esta falso usara la skin por defecto de alchemist

@export_category("Movement")
@export_range(0, 100000000000000) var max_stamina: int #cada movimiento deberia gastar 20 de estamina por defecto
@export_range(0, 100000000000000) var max_mana: int #cada ataque consume 10 de mana por defecto
@export_range(0, 100) var elevator_initial_index: int = 0
@export var elevator_vector_position: Array[Resource] = []

@export_category("Custom Components")
@export var custom_movement_resource: BaseMovementResource
@export var custom_attack_resource: BaseAttackResource
@export var custom_live_resource: BaseLiveResource


@export_category("Powers and Items")
@export var default_powers: Array[Resource] = [] #Los poderes que ya tiene desde el inicio
@export var obtained_powers: Array[Resource] = [] #Los poderes que ha obtenido
@export var default_items: Array[Resource] = []
@export var obtained_items: Array[Resource] = []

#endregion

#Internal variables
@onready var arm: ArmBase = $Arm

var default_movement_resource: BaseMovementResource
var default_attack_resource: BaseAttackResource
var defaults_live_resource: BaseLiveResource
var stamina: int = max_stamina
var mana: int = max_mana
