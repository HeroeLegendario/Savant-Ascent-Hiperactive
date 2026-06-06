class_name BaseElevator2D
extends AnimatableBody2D

@export_category("Property of the Elevator")
@export var elevator_live: int = 50
@export var index_priority: int = 0
@export var prop_resource: PropComponentNode

var player_stand_position: Vector2


func _process(_delta: float) -> void:
	player_stand_position = $PlayerStepFloor.position
