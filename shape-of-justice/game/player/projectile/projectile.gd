extends CharacterBody2D

class_name Projectile

@export var speed = 500

@onready var hit_box: HitBox = $HitBox
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D

@onready var DiceComponent = preload("res://game/core/dice_component.gd").new()

var spawn_position: Vector2
var spawn_rotation: float

func _ready():
	hit_box.connect("body_entered", on_colision)
	global_position = spawn_position
	global_rotation = spawn_rotation
	
	hit_box.damage = DiceComponent.roll_dice(1, 4)
	
func _physics_process(delta: float) -> void:
	velocity = Vector2(0, -speed).rotated(spawn_rotation)
	move_and_slide()
	
func on_colision(body) -> void:
	queue_free()
