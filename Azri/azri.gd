extends CharacterBody2D

const SPEED: float = 45.0

@onready var animated_sprite_2d = $AnimatedSprite2D

enum direction { NORTH, SOUTH, EAST, WEST }
var last_direction = direction.SOUTH;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	walk()
	idle()
	move()


func idle() -> void:
	if last_direction == direction.NORTH and !Input.is_action_pressed("north"):
		animated_sprite_2d.play("idle_north")
	if last_direction == direction.SOUTH and !Input.is_action_pressed("south"):
		animated_sprite_2d.play("idle_south")
	if last_direction == direction.EAST and !Input.is_action_pressed("east"):
		animated_sprite_2d.play("idle_east")
	if last_direction == direction.WEST and !Input.is_action_pressed("west"):
		animated_sprite_2d.play("idle_west")

func walk() -> void:
	if Input.is_action_pressed("north"):
		animated_sprite_2d.play("walk_north");
		last_direction = direction.NORTH
	if Input.is_action_pressed("south"):
		animated_sprite_2d.play("walk_south");
		last_direction = direction.SOUTH
	if Input.is_action_pressed("east"):
		animated_sprite_2d.play("walk_east");
		last_direction = direction.EAST
	if Input.is_action_pressed("west"):
		animated_sprite_2d.play("walk_west");
		last_direction = direction.WEST

func move() -> void:
	var direction = Input.get_vector("west", "east", "north", "south")
	self.velocity = direction * SPEED

	move_and_slide()
	
