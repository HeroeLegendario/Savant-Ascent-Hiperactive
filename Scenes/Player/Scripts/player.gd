extends CharacterBody2D
class_name BasePlayer

const MIN_ELEVATORS: int = 0 # Siempre deberia haber un elevador
const MAX_ELEVATORS: int = 100
const FOLDER_OF_DEFAULT: String = "res://DEFAULT/"
const DEFAULT_LIVES: int = 3
const MAX_LIVES: int = 5


@export_category("Switches")
@export var have_stamina: bool = false
@export var hit_stop_movement: bool = false
@export var have_personalized_lives: bool = false # Las vidas personalizadas son basicamente para que el personaje tenga diferentes efectos dependiendo de que vidas tengan si es falso usara un entero local del personaje cuyo sistema de vidas seran similar al modo historia de savant ascent remix en dificultad media
@export var have_personalized_movement: bool = false # Esto es para cambiar el tipo de movimiento que recorrera el personaje al moverse o saltar, si esta desactivado usara el movimiento del savant ascent original: el salto es en forma de triangulo y su movimiento es recto al cambiar de plataformas
@export var have_personalized_skin: bool = false # Si esta falso usara la skin por defecto de alchemist

@export_category("Movement")
@export_range(0, 999999999) var stamina: int
@export_range(0, 100) var elevator_initial_index: int = 0
@export var elevator_vector_position: Array[Resource] = []

@export_category("Powers")
@export var default_powers: Array[Resource] = []
@export var obtained_powers: Array[Resource] = []

#Internal variables
@onready var arm: Node2D = $Arm
@onready var custom_components: Node = $"Custom Components"
