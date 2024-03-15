extends Node2D

@onready var day_change_timer = $DayChangeTimer
@onready var day_change = $DayChange
@onready var sunny = $Sunny
@onready var overcast = $Overcast
@onready var weather_manager = $WeatherManager


var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	SignalManager.day_change.connect(_change_day_scene)
	day_change_timer.timeout.connect(_hide_new_day)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _change_day_scene():
	day_change_timer.start()
	day_change.show()
	_change_day()

func _change_day():
	var todays_weather = rng.randf_range(0, 10)
	if todays_weather < 2:
		sunny.hide()
		overcast.show()
		weather_manager.show()
		var rain: GPUParticles2D = weather_manager.find_child("rain")
		rain.emitting = true
		DayNightManager.WEATHER = "RAIN"
		print("RAIN")
	elif todays_weather >= 2:
		sunny.show()
		overcast.hide()
		#weather_manager.hide()
		var rain: GPUParticles2D = weather_manager.find_child("rain")
		rain.emitting = false
		DayNightManager.WEATHER = "SUN"
		print("SUN")

func _hide_new_day() -> void:
	day_change.hide()
