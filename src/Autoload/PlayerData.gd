extends Node

signal score_updated
signal player_died

var score: int = 0:
	set(new_value):
		score = new_value
		emit_signal("score_updated")

var deaths: int = 0:
	set(new_value):
		deaths = new_value
		emit_signal("player_died")

func reset():
	score = 0
	deaths = 0
