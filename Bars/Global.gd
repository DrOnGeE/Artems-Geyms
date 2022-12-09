extends Node

var score = 0

var max_lives = 3
var lives = max_lives
var hud

func lose_life():
	lives -= 1
	if lives == -1:
		lives = 0
	hud.load_hearts()
	
func plus_heart():
	lives += 1
	if lives > max_lives:
		lives = max_lives
	hud.load_hearts()
