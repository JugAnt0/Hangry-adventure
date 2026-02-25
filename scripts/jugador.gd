extends CharacterBody2D
@onready var jugador: AnimatedSprite2D = $AnimatedSprite2D


const SPEED = 150.0
const JUMP_VELOCITY = -300.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("salto") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		jugador.play("saltar")

	var direction := Input.get_axis("mover a la izquierda", "mover a la derecha")
	
	if direction:
		velocity.x = direction * SPEED
		jugador.play("correr")
		if direction > 0:
			jugador.flip_h = false
		if direction <0:
			jugador.flip_h = true
		
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		jugador.play("idola")
	move_and_slide()
