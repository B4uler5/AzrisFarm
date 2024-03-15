extends Node

var plantedCrops = []

# Called when the node enters the scene tree for the first time.
func _ready():
	plantedCrops += get_tree().get_nodes_in_group("crop")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
