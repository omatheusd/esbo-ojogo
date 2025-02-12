extends Node2D
@onready var control: Control = $hud/Control



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	control.time_is_up.connect(reload_game)
	Hud.coins = 0
func _process(delta: float) -> void:
	pass
func reload_game():
	await get_tree().create_timer(1,0).timeout
	get_tree().reload_current_scene()
