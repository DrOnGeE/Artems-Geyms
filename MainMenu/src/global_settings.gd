extends Node

signal brightness_updated(value)

func toggle_fullscreen(toggle):
	OS.window_fullscreen = toggle
	NewScript.game_data.fullscreen_on = toggle
	NewScript.save_data()

func update_brightness(value):
	emit_signal("brightness_updated", value)
	NewScript.game_data.brightness = value
	NewScript.save_data()

func update_master_vol(vol):
	AudioServer.set_bus_volume_db(0, vol)
	NewScript.game_data.master_vol = vol
	NewScript.save_data()

func update_music_vol(vol):
	AudioServer.set_bus_volume_db(1, vol)
