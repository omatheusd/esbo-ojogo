extends Area2D



func _on_body_entered(body: Node2D) -> void:
	if body.name == "player":
		Hud.score = Hud.score + 100
		owner.queue_free()
