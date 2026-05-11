extends AnimatableBody2D
class_name BaseElevator2D

@export_category("Property of the Elevator")
@export var elevator_live: int = 50

var player_stand_position: Vector2

func _process(_delta: float) -> void:
	player_stand_position = $PlayerStepFloor.position
