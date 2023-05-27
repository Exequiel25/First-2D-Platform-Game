extends Button

@export_file var next_scene_path: String = ""

func _on_button_up():
	get_tree().change_scene_to_file(next_scene_path)
