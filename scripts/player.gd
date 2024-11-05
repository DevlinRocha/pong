extends CharacterBody2D


const SPEED = 4


func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("player1_up"):
		position.y -= SPEED
	if Input.is_action_pressed("player1_down"):
		position.y += SPEED

	move_and_slide()
