# Place on the spellcasting UI, calculates the spells based on existing parts placed in spell menu
extends Control
@export var sigil_slot: PackedScene
var slots: Array = []


static func calculate(recipe: SpellRecipeData) -> SpellBehavior:
	var behavior = SpellBehavior.new()
	return behavior

static func get_affecting_modifiers():
	pass

static func angle_distance(a: float, b: float) -> float:
	var diff = abs(a - b)
	return min(diff, TAU - diff)  # shortest arc between two angles

static func apply_sigil_with_modifiers():
	pass

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
