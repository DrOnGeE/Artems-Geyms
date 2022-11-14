extends CanvasLayer

#onready var settings_menu = $SettingsMenu

#func _ready():
	#$VBoxContainer/VBoxContainer/Start.grab_focus()
	
	
func _on_Exit_pressed():
	get_tree().quit()
	
#func _on_Start_pressed():
	#get_tree().change_scene("res://options_newGame.tscn")
	
func _on_Options_pressed():
	#$settings_menu.popup_centered()
	$settings_menu.show()
	pass
