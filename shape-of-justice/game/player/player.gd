extends CharacterBody2D

class_name Player

@export var speed = 500

@onready var Bullet = preload("res://game/player/projectile/projectile.tscn")
@onready var attack_spawn_point: Marker2D = $AttackSpawnPoint
@onready var timer: Timer = $Timer

enum {
	IDLE, 
	MOVE, 
	ATTACK, 
	DASH
}

var state = IDLE
var can_attack = true

func get_movement_input(delta):
	look_at(get_global_mouse_position())
	var input_direction = Input.get_vector("left", "right", "up", "down").normalized()
	velocity = (input_direction * speed)

func _physics_process(delta):
	get_movement_input(delta)
	move_and_slide()
	
	if Input.is_action_pressed("attack") && can_attack:
		spawn_bullet()

func spawn_bullet():
	var bullet = Bullet.instantiate()
	bullet.spawn_position = attack_spawn_point.global_position
	bullet.spawn_rotation = rotation + 1.5708 # -90 deg in radians
	
	get_parent().add_child(bullet)
	
	timer.start()
	can_attack = false
	
func _on_timer_timeout() -> void:
	can_attack = true
