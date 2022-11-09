extends Popup

# Video Settings
onready var display_options = $SettingsTab/Video/MarginContainer/VideoSettings/OptionButton
onready var brightness_slider = $SettingsTab/Video/MarginContainer/VideoSettings/BrightnessSlider

# Audio Settings
onready var master_slider = $SettingsTab/Audio/MarginContainer2/AudioSettings/MasterSlider
onready var music_slider = $SettingsTab/Audio/MarginContainer2/AudioSettings/MusicSlider

func _ready():
	
	display_options.select(1 if NewScript.game_data.fullscreen_on else 0)
	GlobalSettings.toggle_fullscreen(NewScript.game_data.fullscreen_on)
	#brightness_slider.value = NewScript.game_data.brightness
	
	#master_slider.value = NewScript.game_data.master_vol
	#music_slider.value = NewScript.game_data.music_vol
	#func _on_OptionButton_item_selected(index):
	#GlobalSettings.toggle_fullscreen(true if index == 1 else false)
 


func _on_OptionButton_item_selected(index):
	GlobalSettings.toggle_fullscreen(true if index == 1 else false)

func _on_BrightnessSlider_value_changed(value):
	GlobalSettings.update_brightness(value)

func _on_MasterSlider_value_changed(value):
	GlobalSettings.update_master_vol(value)

func _on_MusicSlider_value_changed(value):
	GlobalSettings.update_music_vol(value)
