extends Node
const DEBUG_SCENE = preload("uid://c4loax645yjo7")
var current_scene: Node

func LoadScene(scene_name: String) -> void:
	print("Loading Scene: " + scene_name)
	print("NOT IMPLEMENTED")

func LoadDebugScene() -> void:
	if get_child_count() != 0:
		remove_child(current_scene)
	current_scene = DEBUG_SCENE.instantiate()
	add_child(current_scene)
