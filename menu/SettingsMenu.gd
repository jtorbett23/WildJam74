extends MenuTurbo

class_name SettingsMenu

var close_callback : Callable

func _init(on_close_callback : Callable = Callable()):
	self.close_callback = on_close_callback
	super._init()

func _ready() -> void:
	AudioManager.test_sound_path = "res://assets/sound/droplet.mp3"
	self.set_content("Settings", 
	[	{"name": "Master Volume", "type": HSliderTurbo, 
		"value": AudioManager.current_master_level, "callback": Callable(AudioManager, "set_master_volume")},
		{"name": "Music Volume", "type": HSliderTurbo, 
		"value": AudioManager.current_music_level, "callback": Callable(AudioManager, "set_music_volume")},
		{"name": "Sound Volume", "type": HSliderTurbo, 
		"value": AudioManager.current_sound_level, "callback": Callable(AudioManager, "set_sound_volume")},
		{"name":"Return", "callback": Callable(self, "close") }])

func close() -> void:
	self.queue_free()
	if !close_callback.is_null():
		close_callback.call()
