extends Area2D

@onready var anim_player: AnimationPlayer = $AnimationPlayer

func _on_body_entered(_body:Node2D):
	anim_player.play("fade_out")