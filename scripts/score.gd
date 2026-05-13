extends Label

var score: int = 0

func _on_coin_picked_up(points, isSuperCoin):
	score += points
	text = "Score: " + str(score)
