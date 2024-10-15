extends MenuTurbo

class_name MainMenu

var music_path : String = "res://assets/music/menu.mp3"

func _ready() -> void:
	AudioManager.play_music(music_path)
	self.set_content("Elehaunted", 
	[	{"name": "Start Game", "callback": Callable(self, "start_game")}, 
		{"name":"Settings", "callback": Callable(self, "settings")},
		{"name":"Credits", "callback": Callable(self, "credits")}
		])
	
func start_game() -> void:
	queue_free()

func close() -> void:
	self.queue_free()

func settings():
	UiManager.add(SettingsMenu.new())

func credits():
	UiManager.add(CreditsMenu.new())
