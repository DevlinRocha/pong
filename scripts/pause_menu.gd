extends PanelContainer
#
#
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("player1_pause") or Input.is_action_just_pressed("player2_pause"):
		visible = true if visible == false else false

		get_tree().paused = true if visible == true else false
