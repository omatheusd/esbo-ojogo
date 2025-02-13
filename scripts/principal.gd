extends Node2D
@onready var control: Control = $hud/Control
@onready var player: CharacterBody2D = $player


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#.morreu.connect(reload_game)
	
	control.time_is_up.connect(reload_game)
	Hud.coins = 0
func _process(delta: float) -> void:
	pass
func reload_game():
	await get_tree().create_timer(1,0).timeout
	get_tree().reload_current_scene()


func _on_player_morreu() -> void:
	player.position = Vector2(108, 551)
	Hud.coins = 0
	Hud.score = 0
		
