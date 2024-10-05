extends Label

@export var health: Health

func _ready() -> void:
	update_text()	
	health.connect("health_changed", update_text)
		
func update_text():
	if health != null:
		text = str(health.health) + "/" + str(health.max_health)
