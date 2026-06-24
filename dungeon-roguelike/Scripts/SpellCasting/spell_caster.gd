# Goes on the player, creates the projectiles for spells
extends Node3D

@export var projectile_scene: PackedScene

func cast() -> void:
	var projectile = projectile_scene.instantiate()
	get_tree().current_scene.add_child(projectile)
	projectile.global_position = global_position
	projectile.shoot(Vector3(0, 1, 1))

func _input(event):
	if event.is_action_pressed("attack"):
		cast()
