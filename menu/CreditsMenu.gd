extends MenuTurbo

class_name CreditsMenu

func _ready() -> void:
	
	var credits_text = "
	Level & Character Art
	- Momo
	"
	
	self.set_content("Credits", 
	[	{"name": "Credits", "type": Label, "text": credits_text},
		{"name": "Return", "callback": Callable(self, "close")}
	])
	
func close() -> void:
	self.queue_free()
