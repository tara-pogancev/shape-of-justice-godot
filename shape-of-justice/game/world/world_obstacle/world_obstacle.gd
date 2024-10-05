extends StaticBody2D

@export var shape_color: Color = Color8(1, 1, 1)
@onready var polygon_2d: Polygon2D = $Polygon2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	polygon_2d.color = shape_color
