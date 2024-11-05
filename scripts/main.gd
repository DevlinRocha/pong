extends ColorRect

@onready var left_score_zone: Area2D = $LeftScoreZone
@onready var right_score_zone: Area2D = $RightScoreZone
@onready var player_1_score: Label = %Player1Score
@onready var player_2_score: Label = %Player2Score
@onready var goal_screen: Label = %GoalScreen
@onready var pause_menu: PanelContainer = %PauseMenu


func _ready() -> void:
	left_score_zone.player_scored.connect(_on_player_scored.bind(2))
	right_score_zone.player_scored.connect(_on_player_scored.bind(1))
	start_game()


func start_game() -> void:
	goal_screen.visible = false
	pause_menu.visible = false
	const BALL := preload("res://scenes/ball.tscn")
	var new_ball = BALL.instantiate()

	add_child(new_ball)
	new_ball.respawn()
	new_ball.move()


func _on_player_scored(player: int) -> void:
	match player:
		1:
			var score := int(player_1_score.text)
			score += 1
			player_1_score.text = str(score)
			goal_screen.text = "Player 1 Scored"
			goal_screen.visible = true
		2:
			var score := int(player_2_score.text)
			score += 1
			player_2_score.text = str(score)
			goal_screen.text = "Player 2 Scored"
			goal_screen.visible = true

	get_tree().create_timer(3).timeout.connect(start_game)
