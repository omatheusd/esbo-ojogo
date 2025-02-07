extends CharacterBody2D

var speedx = 100
const speed = 300.0
const forca_pulo = -400.0


func _physics_process(delta: float) -> void:   
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	if position.x <= 15:
		position.x = 15
	if position.x >= 1137:
		position.x = 1137
	#print(is_on_floor())
	# Handle jump.
	if Input.is_action_just_pressed("space") and is_on_floor():
		velocity.y = forca_pulo

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("esquerda(player1)", "direita(player1)")
	if direction:
		velocity.x = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)

	move_and_slide()
