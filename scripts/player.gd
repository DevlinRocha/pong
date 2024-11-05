extends CharacterBody2D


@export var Player: Type


enum Type {player1, player2}
const SPEED = 320


func _process(delta: float) -> void:
	player1_controls(delta) if Player == Type.player1 else player2_controls(delta)
	move_and_slide()


func player1_controls(delta: float) -> void:
	if Input.is_action_pressed("player1_up"):
		position.y -= SPEED * delta
	if Input.is_action_pressed("player1_down"):
		position.y += SPEED * delta


func player2_controls(delta: float) -> void:
	if Input.is_action_pressed("player2_up"):
		position.y -= SPEED * delta
	if Input.is_action_pressed("player2_down"):
		position.y += SPEED * delta
