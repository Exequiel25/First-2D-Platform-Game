extends Area2D

@onready var anim_player: AnimationPlayer = $AnimationPlayer

@export var coin_score: int = 10

func _on_body_entered(_body:Node2D):
	anim_player.play("fade_out")
	PlayerData.score += coin_score