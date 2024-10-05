extends CharacterBody2D

@export var speed = 400

enum {
	IDLE, 
	MOVE, 
	ATTACK, 
	DASH
}

var state = IDLE

func get_movement_input(delta):
	look_at(get_global_mouse_position())
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = (input_direction * speed)

func _physics_process(delta):
	get_movement_input(delta)
	move_and_slide()
