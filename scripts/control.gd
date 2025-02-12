extends Control

@onready var coins_counter = $Container/moedas_Container/contador as Label
@onready var timer_counter = $Container/timer_Container3/timer_contador as Label
@onready var score_counter = $Container/score_Container2/contador_score as Label
@onready var clock: Timer = $"../../hud/Control/clock"

var segundos = 0
var minutos = 0
var coins := 1
@export_range(0,5) var default_minutos := 1
@export_range(0,59) var default_segundos := 0
signal time_is_up()
func _ready() -> void:
	coins_counter.text = str("%04d" % Hud.coins)
	score_counter.text = str("%06d" % Hud.score)
	timer_counter.text = str("%02d" % default_minutos) + ":" + str("%02d" % default_segundos)
	reset_clock_timer()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	coins_counter.text = str("%04d" % Hud.coins)
	if minutos == 0 and segundos == 0:
		emit_signal("time_is_up")
func _on_clock_timeout() -> void:
	if segundos == 0:
		if minutos > 0:
			minutos -= 1
			segundos = 60
	segundos -= 1

	timer_counter.text = str("%02d" % minutos) + ":" + str("%02d" % segundos)
func reset_clock_timer():
	minutos = default_minutos
	segundos = default_segundos
