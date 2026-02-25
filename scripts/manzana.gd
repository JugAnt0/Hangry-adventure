extends Area2D
@onready var progreso: Node = %progreso




func _on_body_entered(body: Node2D) -> void:
	progreso.sumar_puntos()
	queue_free()
