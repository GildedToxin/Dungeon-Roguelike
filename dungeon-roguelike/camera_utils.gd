
extends Node
## List of utility methods for camera calculations
class_name CameraUtils

## Covert pixel size into viewport width rate (similar to vw units)
func pixel_to_rate(value: int) -> int:
	var wp_size = get_viewport().size
	return value * 100 / wp_size.x

## Convert from viewport width rate into pixel size
func rate_to_pixel(value: int) -> int:
	var wp_size = get_viewport().size
	return wp_size.x * value / 100
