extends Button

func _pressed():
	get_node("../MySprite").movement += get_node("../MySprite").to_move
	