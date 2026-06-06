class_name ElevatorManager
extends Node

var manager_resource: ElevatorManagerResource = ElevatorManagerResource.new()

func _ready() -> void:
	new_incredibly_inefficient_elevator_allocator_for_the_manager_resource()
	print(manager_resource.elevator_array)

#func incredibly_inefficient_elevator_allocator_for_the_manager():
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

func get_all_children():
	for index in get_children():
		manager_resource.raw_children.append(index)

func check_valid_elevators_from_raw_children() -> Array[BaseElevator2D]:
	var valid_elevators: Array[BaseElevator2D] = []
	for index in manager_resource.raw_children:
		if index is BaseElevator2D:
			valid_elevators.append(index)
	return valid_elevators

func insert_elevators_in_array(elevators: Array[BaseElevator2D], where_to_insert: Array[BaseElevator2D]):
	where_to_insert.append_array(elevators)
	where_to_insert.sort_custom(chatgepetiadas_ordenadoras_elevemonos)

func new_incredibly_inefficient_elevator_allocator_for_the_manager_resource():
	get_all_children()
	check_valid_elevators_from_raw_children()
	var valid_elevators:Array[BaseElevator2D] = check_valid_elevators_from_raw_children()
	insert_elevators_in_array(valid_elevators, manager_resource.elevator_array)

func chatgepetiadas_ordenadoras_elevemonos(a: BaseElevator2D, b: BaseElevator2D):
	if a.position.x < b.position.x:
		return true
	elif a.position.x > b.position.x:
		return false
	else:
		if a.position.y < b.position.y:
			return true
		elif a.position.y > b.position.y:
			return false
		else:
			return a.index_priority < b.index_priority
