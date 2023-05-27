extends Area2D

@onready var anim_player: AnimationPlayer = $AnimationPlayer
@export var next_scene: PackedScene

func teleport():
	anim_player.play("fade_in")
	await anim_player.animation_finished
	get_tree().change_scene_to_file(next_scene.get_path())

func _on_body_entered(_body:Node2D):
	teleport()
