# scripts/score.gd
extends Label

var score: int = 0

func _ready() -> void:
	get_tree().set_auto_accept_quit(false)

func _notification(what: int) -> void:
	if what == NOTIFICATION_WM_CLOSE_REQUEST:
		ScoreManager.submit_score()
		get_tree().quit()

func _on_coin_picked_up(points, isSuperCoin):
	score += points
	text = "Score: " + str(score)
	ScoreManager.update_score(score)  # ← Step 4 goes here
