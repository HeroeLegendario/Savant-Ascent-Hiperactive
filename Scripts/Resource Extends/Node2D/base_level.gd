class_name LevelNode
extends Node

@export_category("Switches")
@export var beatemup_or_timed: bool = false # si esta en true significa que tienes que sobrevivir hasta que termine el juego, si esta en false de beatemup basicamentes que destruir todos los enemigos

@export_category("Basic Configuration")
@export var level_name: String = ""
@export_range(0, 2 ** 63 - 1) var wave_time: int = 0 # El tiempo de las oleadas en segundos antes de iniciar una nueva, esto se usa si una oleada del nivel tiene tiempo 0
@export var rounds_enemy: Array[EnemyRoundsSystem]
@export var elevator_manager: ElevatorManager
@export var player_spawn_elevator: BaseElevator2D

#func _process(delta: float) -> void:
	#get_tree().root.visible = false
