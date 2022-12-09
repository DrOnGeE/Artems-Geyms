extends Label


func _process(delta):
	self.text = str(Global.score)

func _on_Button3_pressed():
	Global.score += 1


func _on_Button4_pressed():
	Global.score -= 1
