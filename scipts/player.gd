extends CharacterBody2D
signal pegou
var speedx = 300
const speed = 100.0
const forca_pulo = -400.0
var is_jumping := false
@onready var animaçao := $AnimatedSprite2D as AnimatedSprite2D
func _physics_process(delta: float) -> void:   
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	#print(is_on_floor())
	# Handle jump.
	if Input.is_action_just_pressed("space") and is_on_floor():
		velocity.y = forca_pulo
		is_jumping = true
	elif is_on_floor():
		is_jumping = false
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("esquerda(player1)", "direita(player1)")
	if direction:
		velocity.x = direction * speed
		if direction == -1:
			animaçao.flip_h = 1
		else:
			animaçao.flip_h = 0
		if !is_jumping:
			animaçao.play("correr")

	elif is_jumping:
		animaçao.play("pulo")
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		animaçao.play("parado")
	move_and_slide()
	


func adicionamoeda(area) -> void:
	print("ppppp")
	pegou.emit()
