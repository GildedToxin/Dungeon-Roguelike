extends Control
@export var sigil_slot: PackedScene
var slots: Array = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func position_slots_on_circle(num_slots: int, radius: float):
	for i in num_slots:
		var slot = sigil_slot.instantiate()
		add_child(slot)
		slots.append(slot)
		
		var angle = (TAU / num_slots) * i
		var slot_pos = Vector2(cos(angle), sin(angle)) * radius
		slots[i].position = slot_pos
		slots[i].metadata_angle = angle
