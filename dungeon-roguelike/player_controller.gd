extends CharacterBody3D

@export var speed: float = 5.0

@export var camera: Camera3D
@export var rotation_speed := 12.0

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Get the input direction and handle the movement/deceleration.
	var input_dir := Input.get_vector("move_left", "move_right", "move_up", "move_down")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * speed
		velocity.z = direction.z * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		velocity.z = move_toward(velocity.z, 0, speed)

	move_and_slide()
	
	rotate_player_to_mouse(delta)

func rotate_player_to_mouse(delta: float):
	
	# Creates a plane at the players feet - used to place the cursors position relative to the player
	var cursor_plane : Plane = Plane(Vector3(0,1,0), global_transform.origin.y)
	
	# Gets the mouse position on the screen
	var mouse_pos = get_viewport().get_mouse_position()
	
	# Turns the mouse position into a 3D point where the raycast starts 
	var raycast_start = camera.project_ray_origin(mouse_pos)
	
	# Creates the endpoint of the raycast - gets the direction, makes it long, and adds it to the start
	var raycast_end = raycast_start + camera.project_ray_normal(mouse_pos) * 1000
	
	# Checks where on the created plane the cursor is
	var cursor_pos = cursor_plane.intersects_ray(raycast_start, raycast_end)
	
	# Rotates to look at the cursor position 
	look_at(cursor_pos, Vector3.UP)
