extends MeshInstance3D

@export var ground_plane: MeshInstance3D
@export var grass_mesh: MeshInstance3D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var mat = get_active_material(0)
	
	if mat == null:
		push_error("Could not find grass material")
		return
	
	var aabb = ground_plane.get_aabb()
	var global_pos = ground_plane.global_transform.origin
	
	var min_xz = Vector2(global_pos.x + aabb.position.x, global_pos.z + aabb.position.z)
	var max_xz = Vector2(global_pos.x + aabb.end.x, global_pos.z + aabb.end.z)
	
	mat.set_shader_parameter("ground_min", min_xz)
	mat.set_shader_parameter("ground_max", max_xz)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
