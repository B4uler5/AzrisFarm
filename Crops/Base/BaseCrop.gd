extends Node2D

class_name BaseCrop

@onready var animated_sprite_2d = $InteractableArea/AnimatedSprite2D

var current_stage = 0
const max_stage = 3

func _ready():
	SignalManager.day_change.connect(_change_frame)

func _process(delta):
	pass


func _change_frame():
	if current_stage < max_stage:
		current_stage += 1
		animated_sprite_2d.set_frame_and_progress(current_stage + 1, 0)
	else:
		SignalManager.crop_grown.emit()
