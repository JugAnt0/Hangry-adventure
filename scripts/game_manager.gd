extends Node
@onready var label: Label = $Label

var puntos = 0

func sumar_puntos():
	puntos += 1
	label.text = "Peladin comio " + str(puntos) + " manzanas"
