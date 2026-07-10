extends Node
#class_name InputBufferNode
#region Fracaso rotundo
# Este sistema de input buffer me lo robe de github, el usuario se llama jhonnyneverwalked y el proyecto godot-input-buffer, el fork de 4.0
#
#const BUFFER_WINDOW: int = 169
#const JOY_DEADZONE: float = 0.5 #inutil, pero lo annado por si acaso
#
#var keyboard_timestamps: Dictionary
#var joypad_timestamps: Dictionary
#
#func _ready() -> void:
#
	#process_mode = Node.PROCESS_MODE_PAUSABLE
#
	#keyboard_timestamps = {}
	#joypad_timestamps = {}
#
#func _input(event: InputEvent) -> void:
	#if event is InputEventKey:
		#if !event.pressed or event.is_echo():
			#return
#
		#var scancode: int = event.keycode
		#keyboard_timestamps[scancode] = Time.get_ticks_msec()
#
	#elif event is InputEventJoypadButton:
		#if !event.pressed or event.is_echo():
			#return
#
		#var button_index: int = event.button_index
		#joypad_timestamps[button_index] = Time.get_ticks_msec()
	#elif event is InputEventJoypadMotion:
		#if abs(event.axis_value) < JOY_DEADZONE:
			#return
#
		#var axis_code: String = str(event.axis) + "_" + str(sign(event.axis_value))
		#joypad_timestamps[axis_code] = Time.get_ticks_msec()
#
#
#func is_action_press_buffered(action: String) -> bool:
#
	#for event in InputMap.action_get_events(action):
		#if event is InputEventKey:
			#var scancode: int = event.keycode
			#if keyboard_timestamps.has(scancode):
				#if Time.get_ticks_msec() - keyboard_timestamps[scancode] <= BUFFER_WINDOW:
					#_invalidate_action(action)
					#return true
		#elif event is InputEventJoypadButton:
			#var button_index: int = event.button_index
			#if joypad_timestamps.has(button_index):
				#var delta = Time.get_ticks_msec() - joypad_timestamps[button_index]
				#if delta <= BUFFER_WINDOW:
					#_invalidate_action(action)
					#return true
		#elif event is InputEventJoypadMotion:
			#if abs(event.axis_value) < JOY_DEADZONE:
				#return false
			#var axis_code: String = str(event.axis) + "_" + str(sign(event.axis_value))
			#if joypad_timestamps.has(axis_code):
				#var delta = Time.get_ticks_msec() - joypad_timestamps[axis_code]
				#if delta <= BUFFER_WINDOW:
					#_invalidate_action(action)
					#return true
#
	#return false
#
#func _invalidate_action(action: String) -> void:
	#for event in InputMap.action_get_events(action):
		#if event is InputEventKey:
			#var scancode: int = event.keycode
			#if keyboard_timestamps.has(scancode):
				#keyboard_timestamps[scancode] = 0
		#elif event is InputEventJoypadButton:
			#var button_index: int = event.button_index
			#if joypad_timestamps.has(button_index):
				#keyboard_timestamps[button_index] = 0
		#elif event is InputEventJoypadMotion:
			#var axis_code: String = str(event.axis) + "_" + str(sign(event.axis_value))
			#if joypad_timestamps.has(axis_code):
				#joypad_timestamps[axis_code] = 0
#
##probarlo con el sistema actual e intentar mejorarlo
##primero hay que ponerlo en un autoload

#endregion
#region Fracaso rotundo 2
#const TIMESTAMP: int = 69
#
#var input_resource: BaseInputResource
#var diccionario_basico_de_accion: Dictionary = {}
#var input_buffer: Array[Dictionary] = []
#
#func _ready() -> void:
	#pass
#
#
#func action_send_to_buffer():
	#pass
#
#func action_from_buffer_pressed():
	#pass
#
#func destroy_action_from_buffer():
	#pass
#endregion
