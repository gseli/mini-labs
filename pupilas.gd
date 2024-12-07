extends Node2D  # Asegúrate de que el nodo 'pupilas' sea un Node2D o similar

# Constante para la distancia máxima de movimiento de las pupilas
const MAX_DISTANCE = 5

func _process(delta):
	# Obtener la posición global del ratón
	var mouse_pos = get_global_mouse_position()
	
	# Obtener la posición global del centro del ojo (padre del nodo actual)
	var eye_center = get_parent().global_position

	# Calcular el vector de dirección del centro del ojo al ratón
	var direction = (mouse_pos - eye_center).normalized()

	# Limitar el movimiento de las pupilas
	var distance = (mouse_pos - eye_center).length()
	var constrained_pos = direction * min(MAX_DISTANCE, distance)

	# Actualizar la posición de las pupilas relativa al nodo padre
	position = constrained_pos
