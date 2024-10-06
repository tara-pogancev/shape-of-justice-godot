extends Node

class_name DiceComponent

# Rolls a dice with `number_of_rolls` and `dice_type` (e.g. 1d4, 2d6, etc.)
func roll_dice(number_of_rolls: int, dice_type: int) -> int:
	var total_roll = 0
	for i in range(number_of_rolls):
		total_roll += randi_range(1, dice_type)
	return total_roll


func roll_damage(number_of_rolls: int, dice_type: int) -> int:
	var damage = roll_dice(number_of_rolls, dice_type)
	var is_critical = roll_dice(1, 20) == 20
	if is_critical:
		return 2*damage
	else:
		return damage
