extends Control

@onready var scene_tree = get_tree()
@onready var pause_overlay: ColorRect = $PauseOverlay
@onready var score_label: Label = $ScoreLabel
@onready var pause_title: Label = $PauseOverlay/Title

const DEATH_MESSAGE = "You died!"

var paused: bool = false:
	set(new_value):
		paused = new_value
		scene_tree.paused = paused
		pause_overlay.visible = paused

func _ready():
	PlayerData.connect("score_updated", _update_interface)
	PlayerData.connect("player_died", _PlayerData_player_died)
	_update_interface()

func _unhandled_input(event):
	if event.is_action_pressed("pause") and pause_title.text != DEATH_MESSAGE:
		self.paused = not paused

func _update_interface():
	score_label.text = "Score: %s" % PlayerData.score

func _PlayerData_player_died():
	self.paused = true
	pause_title.text = DEATH_MESSAGE
