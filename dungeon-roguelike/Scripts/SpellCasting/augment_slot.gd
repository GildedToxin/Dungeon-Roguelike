extends Control


func _can_drop_data(_at_position: Vector2, _data: Variant) -> bool:
	return true
	#return false
	
func _drop_data(_at_position: Vector2, data: Variant) -> void:
	data.get_parent().remove_child(data)
	add_child(data)
