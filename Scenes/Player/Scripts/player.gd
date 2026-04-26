extends CharacterBody2D
class_name BasePlayer
const MIN_ELEVATORS: int = 0 # Siempre deberia haber un elevador
const MAX_ELEVATORS: int = 100

@export_category("Movement")
@export_range(0, 100, 1) var elevator_initial_index: int = 0
@export var elevator_vector_position: Array[Resource] = []

@export_category("Powers")
@export var default_powers: Array[Resource] = []
@export var obtained_powers: Array[Resource] = []
