extends Polygon2D

@export var shape_color: Color

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if color != null:
		shape_color = color
