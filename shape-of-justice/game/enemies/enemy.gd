extends CharacterBody2D

@export var speed = 400

var player: Player = null

func _ready() -> void:
	# Safely cast the player node to the Player type
	player = get_tree().current_scene.get_node("Player") as Player

func _physics_process(delta: float) -> void:
	velocity = Vector2.ZERO  
	seek_player()
	move_and_slide()

func seek_player():
	if player != null:
		var player_position = player.position
		var target_direction = (player_position - position).normalized()
		
		# Check if the player is far enough to move toward them
		if position.distance_to(player_position) > 100:
			velocity = target_direction * speed  # Calculate velocity
			

		look_at(player_position)  # Always look at the player
