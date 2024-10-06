extends Node2D

@export var label_text: String

@onready var label: Label = $Label

@export var type = DAMAGE

enum {
	DAMAGE, 
	CRITICAL_DAMAGE, 
	HEAL
}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	label.text = label_text
	global_rotation = 0
	
	match type:
		DAMAGE:
			set_damage_style()
		CRITICAL_DAMAGE:
			set_critical_damage_style()
		HEAL:
			set_heal_style()

	
func set_damage_style():
	pass
	
func set_critical_damage_style():
	pass
	
func set_heal_style():
	pass

func on_animation_finished():
	queue_free()
