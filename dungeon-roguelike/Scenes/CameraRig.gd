extends Node3D

@export var target: CharacterBody3D
@export var follow_speed: float = 5.0
@export var offset: Vector3 = Vector3(0, 0, 0)

func _physics_process(delta):
	if target == null:
		return

	var desired_position = target.global_position + offset

	global_position = global_position.lerp(
		desired_position,
		follow_speed * delta
		)
