extends Node

const PLAYER = preload("uid://dskimq7aam0br")
const CAM_RIG = preload("uid://c42wahi6383ju")

var players: Array[CharacterBody3D]

func _ready() -> void:
	Network.host_created.connect(on_host_created)
	

func on_host_created() -> void:
	spawn_player(multiplayer.get_unique_id())
	multiplayer.peer_connected.connect(spawn_player)
	

func spawn_player(peer_id: int) -> void:
	var new_player: CharacterBody3D = PLAYER.instantiate() as CharacterBody3D
	var player_cam: Node = CAM_RIG.instantiate()
	
	new_player.name = str(peer_id)
	player_cam.name = str(peer_id)+ "_cam"
	
	player_cam.target = new_player
	
	add_child(new_player)
	
	if get_tree().current_scene.name == "test_scene":
		get_tree().get_root().get_node("test_scene/SubViewportContainer/SubViewport").add_child(player_cam, true)
	else:
		get_tree().get_root().get_node("SceneManager/test_scene/SubViewportContainer/SubViewport").add_child(player_cam, true)

	initialize_player(new_player)


func initialize_player(player: CharacterBody3D) -> void:
	#player.position = $test_scene/SpawnPoint.position
	for other in players:
		player.add_collision_exception_with(other)
	players.append(player)

func _on_button_host_pressed() -> void:
	Network.host_lobby()
	SceneManager.LoadDebugScene()
	$MainMenu.hide()
	



func _on_button_quit_pressed() -> void:
	get_tree().quit()


func _on_multiplayer_spawner_spawned(node: Node) -> void:
	if node is CharacterBody3D:
		initialize_player(node)
