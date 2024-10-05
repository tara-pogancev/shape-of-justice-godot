extends Node2D

class_name Health

@export var max_health = 10

signal on_health_deplated

signal on_health_changed

var health;

func _ready():
	health = max_health;
	
func deal_dagame(damage):
	health -= damage
	
	on_health_changed.emit()
	
	if (health <= 0):
		on_health_deplated.emit()
	
func heal(healing):
	health +=healing
	
	on_health_changed.emit()
	
