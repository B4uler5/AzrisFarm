extends Node2D

@onready var interactable_area = $InteractableArea
@onready var overcast = $"../Overcast"
@onready var sunny = $"../Sunny"


# Called when the node enters the scene tree for the first time.
func _ready():
	interactable_area.interact = Callable(self, "_on_interact")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_interact():
	SignalManager.day_change.emit()
	if DayNightManager.WEATHER == "SUN":
		sunny.INITIAL_HOUR = 6
	if DayNightManager.WEATHER == "RAIN":
		overcast.INITIAL_HOUR = 6
