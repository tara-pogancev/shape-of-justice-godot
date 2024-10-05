extends Camera2D

@onready var top_left_limit: Marker2D = $Limits/TopLeftLimit
@onready var bottom_right_limit: Marker2D = $Limits/BottomRightLimit

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	limit_top = top_left_limit.position.y
	limit_bottom = bottom_right_limit.position.y
	limit_left = top_left_limit.position.x
	limit_right = bottom_right_limit.position.x
