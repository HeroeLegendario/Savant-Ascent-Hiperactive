extends Node2D
class_name BaseLevel2D

@export_category("Switches")
@export var beatemup_or_timed: bool = false # si esta en true significa que tienes que sobrevivir hasta que termine el juego, si esta en false de beatemup basicamentes que destruir todos los enemigos

@export_category("Basic Configuration")
@export var level_name: String = ""
@export_range(0, 999999999999999999) var level_time: int = 0 # El tiempo del nivel en segundos antes de terminar
@export var rounds_enemy: Array[BaseEnemyRoundsResource]
@export var elevators: Array[BaseElevator2D]
