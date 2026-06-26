# Place on the spellcasting UI, calculates the spells based on existing parts placed in spell menu
extends Control

@export var augment_slots: Array[Node]
var augment_names: Array[String]

var speed: float = 1.0
var duration: float = 0.1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _get_augments() -> void:
	for augment in augment_slots:
		if get_child_count() > 0:
			augment_names.append(get_node("SpellModifier").augment_name)

func _calculate() -> void:
	for augment_name in augment_names:
		pass
