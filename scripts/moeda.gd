extends Area2D


@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
var coins := 1
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	$AnimatedSprite2D.play("coletando_1")
	if collision_shape_2d.disabled == false:
		Hud.coins += coins
		print(Hud.coins)
	collision_shape_2d.disabled = true

	#queue_free()

func _on_animated_sprite_2d_animation_finished() -> void:

	queue_free()
	
	
