extends Button

const MY_DEGREE = PI /180

func _pressed():
	get_node("../MySprite").rotation_degrees +=  15
	get_node("../MySprite").to_move = get_node("../MySprite").to_move.rotated(MY_DEGREE*15)