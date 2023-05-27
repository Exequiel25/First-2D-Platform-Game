extends Area2D

@onready var anim_player: AnimationPlayer = $AnimationPlayer
@export_file var next_scene_path: String = ""

func teleport():
	anim_player.play("fade_in")
	await anim_player.animation_finished
	get_tree().change_scene_to_file(next_scene_path)

func _on_body_entered(_body:Node2D):
	teleport()
