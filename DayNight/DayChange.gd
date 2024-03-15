extends Control

@onready var label = $Label

# Called when the node enters the scene tree for the first time.
func _ready():
	SignalManager.day_change.connect(_change_day_scene)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _change_day_scene():
	label.text = "Day %s on Azri's Farm" % DayNightManager._current_day
	
