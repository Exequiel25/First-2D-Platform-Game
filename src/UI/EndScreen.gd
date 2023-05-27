extends Control

@onready var score_label: Label = $ScoreLabel

func _ready():
	score_label.text = score_label.text % [PlayerData.score, PlayerData.deaths]
