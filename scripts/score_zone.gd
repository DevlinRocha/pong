extends Area2D

signal player_scored


func _ready() -> void:
	if not body_entered.is_connected(_on_body_entered):
		body_entered.connect(_on_body_entered)
	if not body_exited.is_connected(_on_body_exited):
		body_exited.connect(_on_body_exited)


func _on_body_entered(body: Node2D) -> void:
	if body is Ball:
		player_scored.emit()


func _on_body_exited(body: Node2D) -> void:
	if body is Ball:
		body.queue_free()
