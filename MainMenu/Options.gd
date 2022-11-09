extends Node2D


# Video Settings
onready var display_options = $SettingsTab/Video/MarginContainer/VideoSettings/ScreenMode/OptionButton

func _ready():
	
	display_options.select(1 if Save.game_data.fullscreen_on else 0)
	GlobalSettings.toggle_fullscreen(Save.game_data.fullscreen_on)
	#func _on_OptionButton_item_selected(index):
	#GlobalSettings.toggle_fullscreen(true if index == 1 else false)
 


func _on_OptionButton_item_selected(index):
	GlobalSettings.toggle_fullscreen(true if index == 1 else false)
