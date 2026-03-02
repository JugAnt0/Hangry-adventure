extends Node
@onready var label: Label = $Label

var puntos = 0

func sumar_puntos():
	puntos += 1
	label.text = "Comi " + str(puntos) + " manzanas, pero sigo con hambre"
	if puntos == 50:
		label.text = "UFF, estoy lleno. Gracias por ayudarme a comer 50 manzanas!"
	
