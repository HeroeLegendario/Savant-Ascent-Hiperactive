extends Resource
class_name BaseMovementResource

@export var left_action: InputEventAction
@export var right_action: InputEventAction
@export var jump_action: InputEventAction

func _get_direction() -> int:
	var direction: int
	if left_action.pressed:
		direction = -1
	elif right_action.pressed:
		direction = 1
	if left_action.pressed == false and right_action.pressed == false:
		direction = 0
	return direction
