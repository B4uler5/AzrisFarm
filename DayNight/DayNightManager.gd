extends Node

@export var WEATHER = "RAIN":
	set(w):
		WEATHER = w
	get:
		return WEATHER

@export var _current_day = 1:
	get:
		return _current_day

func _ready():
	SignalManager.day_change.connect(day_change)

func _process(delta):
	pass
	
func day_change():
	_current_day += 1;
