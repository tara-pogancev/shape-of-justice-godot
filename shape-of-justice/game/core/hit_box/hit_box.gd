extends Area2D

class_name HitBox

@export var damage: int = 1


func set_damage(value):
	damage = value
	
func get_damage() -> int:
	return damage
