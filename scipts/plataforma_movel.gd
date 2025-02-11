extends Node2D

var WAIT_DURANTION := 1.0
@onready var plataform := $plataforma
@export var move_speed := 3.0
@export var distance := 192
@export var move_horizontal := true

var follow := Vector2.ZERO
var plataform_center := 16
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	plataform.position = plataform.position.lerp(follow, 0.5)
func move_platform():
	var move_direction = Vector2.RIGHT * distance if move_horizontal else Vector2.UP * distance
	var durantion = move_direction.length() / float(move_speed * plataform_center)
	var platform_tween = create_tween().set_loops().set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_IN_OUT)
	platform_tween.tween_property(self, "follow",move_direction,durantion).set_delay(WAIT_DURANTION)
	platform_tween.tween_property(self, "follow", Vector2.ZERO,	durantion).set_delay(durantion + WAIT_DURANTION * 2)
