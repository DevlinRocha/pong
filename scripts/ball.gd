extends RigidBody2D


func move() -> void:
	var speed := randi_range(240, 400)
	var x: int = [-1, 1].pick_random()
	var y: int = [-1, 1].pick_random()

	linear_velocity = Vector2(x * speed, y * speed)


func respawn() -> void:
	global_position = Vector2(640, 352)
	linear_velocity = Vector2(0, 0)
