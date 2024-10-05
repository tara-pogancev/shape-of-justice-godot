extends Area2D

class_name HurtBox

@export var health: Health

signal recived_damage(damage: int)

func _ready() -> void:
	self.connect("area_entered", _on_area_entered)

func _on_area_entered(area: HitBox) -> void:
	if health != null:
		health.deal_dagame(area.damage)
		recived_damage.emit(area.damage)
