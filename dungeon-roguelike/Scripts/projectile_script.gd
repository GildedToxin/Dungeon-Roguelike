extends RigidBody3D

var speed: float = 1
var duration: float = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func shoot(direction: Vector3) -> void:
	apply_impulse(direction * speed)
