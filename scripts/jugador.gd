extends CharacterBody2D
@onready var jugador: AnimatedSprite2D = $AnimatedSprite2D
@onready var camera_2d: Camera2D = $Camera2D
@onready var death_timer: Timer = $"../death_timer"


const SPEED = 150.0
const JUMP_VELOCITY = -300.0

@onready var panda: CharacterBody2D = $"."

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


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body == panda:
		Engine.time_scale = 0.5
		
		death_timer.start()
		


func _on_death_timer_timeout() -> void:
	Engine.time_scale = 1
	get_tree().reload_current_scene()
