class_name BaseElevator2D
extends AnimatableBody2D

@export_category("Property of the Elevator")
@export var elevator_live: int = 50
@export var prop_resource: PropComponentNode

@onready var player_step_floor: StepFloorArea2D = $PlayerStepFloor
