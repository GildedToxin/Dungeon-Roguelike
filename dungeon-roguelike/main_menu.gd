extends CanvasLayer
@onready var button_join: Button = %ButtonJoin
@onready var button_quit: Button = %ButtonQuit



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	button_join.pressed.connect(on_join)
	button_quit.pressed.connect(func(): get_tree().quit())
	
	if OS.has_feature('server'):
		Network.start_server()
	
	
func on_join():
	add_world()
	Network.join_server()
	hide()

func add_world():
	SceneManager.LoadDebugScene()
