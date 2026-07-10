class_name ElevatorManager
extends Node

var manager_resource: ElevatorManagerResource = ElevatorManagerResource.new()

signal elevator_ended_indexing
signal player_entered_elevator
signal player_exited_elevator

func _ready() -> void:
	new_incredibly_inefficient_elevator_allocator_for_the_manager_resource()

func connect_all_signals_to_children() -> void:
	for i in get_children():
		if i is BaseElevator2D:
			i.player_step_floor.body_entered.connect(_on_body_entered)
			i.player_step_floor.body_exited.connect(_on_body_exited)

func _on_body_entered(_body: Node2D) -> void:
	player_entered_elevator.emit()
	if _body is not BasePlayer2D:
		print(_body)

func _on_body_exited(_body: Node2D) -> void:
	player_exited_elevator.emit()
	if _body is not BasePlayer2D:
		print(_body)

#func incredibly_inefficient_elevator_allocator_for_the_manager(): soy un boludito por hacer esta perra puta mamada xddddd, un recuerdito al menos de mi estupides atomica, puto KISS tuvo siempre la rason
	#var super_switch: bool = true
	#var first_raw_elevator: BaseElevator2D
#
	#for index in manager_resource.raw_children:
		#if index is BaseElevator2D:
			#var switch: bool = false
			#if super_switch:
				#for ondex in manager_resource.raw_children:
					#if ondex == index:
						#first_raw_elevator = ondex
						#switch = true
						#super_switch = false
						#break
			#if switch:
				#continue
			#var a_elevator: BaseElevator2D = index
			#for counter in range(0, manager_resource.raw_children.size()):
				#if counter != 0:
					#if a_elevator.index_to != 0:
						#if manager_resource.elevator_array[a_elevator.index_to] == null:
							#manager_resource.elevator_array[a_elevator.index_to] = a_elevator
							#break
						#else:
							#for countex in range(a_elevator.index_to, manager_resource.elevator_array.size() - 1):
								#if manager_resource.elevator_array[countex] == null:
									#manager_resource.elevator_array[countex] = a_elevator
									#break
								#elif manager_resource.elevator_array[countex] != null and countex == manager_resource.elevator_array.size() - 1:
									#for coumpex in range(0, manager_resource.elevator_array.size() - 1):
										#if manager_resource.elevator_array[coumpex] == null:
											#manager_resource.elevator_array[coumpex] = a_elevator
										#elif manager_resource.elevator_array[coumpex] != null and coumpex == manager_resource.elevator_array.size() - 1:
											#manager_resource.not_valid_elevator.append(a_elevator)
					#else:
						#for countex in range(0, manager_resource.raw_children.size()):
							#if manager_resource.elevator_array[countex] == null:
								#manager_resource.elevator_array[countex] = a_elevator
							#else:
								#continue
				#else:
					#manager_resource.elevator_array[counter] = first_raw_elevator

func send_elevator_by_direction(_actual_elevator: BaseElevator2D, _direction: int) -> BaseElevator2D:
	var index: int = -1
	index = manager_resource.elevator_array.find(_actual_elevator)
	index += _direction
	if index < 0:
		index = 0
	elif index > manager_resource.elevator_array.size() - 1:
		index = manager_resource.elevator_array.size() - 1
	if manager_resource.elevator_array[index] == _actual_elevator:
		return null
	return manager_resource.elevator_array[index]

#region Para ordenar los elevadores

func get_all_children() -> void:
	manager_resource.elevator_array.clear()
	manager_resource.raw_children.clear()
	manager_resource.not_valid_elevator.clear()
	for index in get_children():
		manager_resource.raw_children.append(index)

func check_valid_elevators_from_raw_children() -> Array[BaseElevator2D]:
	var valid_elevators: Array[BaseElevator2D] = []
	for index in manager_resource.raw_children:
		if index is BaseElevator2D:
			if index.prop_resource == null:
				valid_elevators.append(index)
	return valid_elevators

func insert_elevators_in_array(elevators: Array[BaseElevator2D], where_to_insert: Array[BaseElevator2D]) -> void:
	where_to_insert.append_array(elevators)
	where_to_insert.sort_custom(chatgepetiadas_ordenadoras_elevemonos)

func new_incredibly_inefficient_elevator_allocator_for_the_manager_resource() -> void:
	get_all_children()
	var valid_elevators:Array[BaseElevator2D] = check_valid_elevators_from_raw_children()
	insert_elevators_in_array(valid_elevators, manager_resource.elevator_array)
	elevator_ended_indexing.emit()

func chatgepetiadas_ordenadoras_elevemonos(a: BaseElevator2D, b: BaseElevator2D) -> bool: #puedes reutilizar este codigo con elevadores que se mueven, cada vez que se mueven en el centro, por ahora solo hare elevadores estaticos porque razones
	if a.position.x < b.position.x:
		return true
	elif a.position.x > b.position.x:
		return false
	else:
		if a.position.y < b.position.y:
			return true
		else:
			return false
# ultra actualizacion ya me vale verga #actualizacion, al retornarse a si mismo significa que retorna un error, hay que poner el codigo de salida en otro lado o simplemente no lanzar ese error ## esto no se deberia ejecutar a menos que quites lo de get_tree().quit() en cuyo caso deberias reemplazarlo con algo que quite ese ascensor, lo convierta automaticamente en un prop o simplemente no llames esta funcion cuando hayan dos elevadores en la misma posicion :3
			#push_error("tienes dos elevadores en la misma posicion, pon uno de ellos como prop o borralos")
			#get_tree().quit(ErrorCodes.SAHError.SAH_UNEXPECTED_TWO_ELEVATORS_IN_THE_SAME_POSITION_WHEN_BEGIN_THE_LEVEL)
			#este codigo queda pendiente hasta detectar algun error mas grave con respecto a esto
			#quiero un pitote

#endregion
