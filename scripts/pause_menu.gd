extends PanelContainer


signal game_restart


@onready var restart: Button = %Restart
@onready var quit: Button = %Quit


func _ready() -> void:
	if not restart.pressed.is_connected(_on_restart_pressed):
		restart.pressed.connect(_on_restart_pressed)
	if not quit.pressed.is_connected(_on_quit_pressed):
		quit.pressed.connect(_on_quit_pressed)


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("player1_pause") or Input.is_action_just_pressed("player2_pause"):
		visible = true if visible == false else false

		get_tree().paused = true if visible == true else false



func _on_restart_pressed() -> void:
	game_restart.emit()


func _on_quit_pressed() -> void:
	get_tree().quit()
