class_name ElevatorManagerResource
extends Resource

const MAX_ELEVATOR_ARRAY_SIZE: int = 20 # pienso en dejarlo sin limites pero no se xd

var raw_children: Array = []
var elevator_array: Array[BaseElevator2D] = [] #estos son los elevadores activos de la escena
var not_valid_elevator: Array = []
