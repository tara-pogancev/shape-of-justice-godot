extends Area2D

class_name HurtBox

@export var health: Health

@onready var FloatingTextEffect = preload("res://game/effects/floating_text_effect/floating_text_effect.tscn")
@onready var scene_root = get_tree().get_current_scene()

signal recived_damage(damage: int)


func _ready() -> void:
	self.connect("area_entered", _on_area_entered)

func _on_area_entered(area: HitBox) -> void:
	if health != null:
		health.deal_dagame(area.damage)
		show_damage_label(area.damage)
		recived_damage.emit(area.damage)

func show_damage_label(damage):
	var effect = FloatingTextEffect.instantiate()
	effect.label_text = str(damage) 
	effect.global_position = global_position
	scene_root.add_child(effect)
