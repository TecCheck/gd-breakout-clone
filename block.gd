@tool
extends Sprite2D

signal destroyed(value)

@export var value = 1
@export var health = 1
@export var color = BlockColor.BLUE:
	get:
		return color
	set(value):
		self.frame = value
		color = value

# Called when the node enters the scene tree for the first time.
func _ready():
	self.frame = color

func hit():
	health = health - 1
	
	if health <= 0:
		destroyed.emit(value)
		queue_free()

enum BlockColor {
	BLUE = 0,
	ORANGE = 1,
	GREEN = 2,
	RED = 3,
	PURPLE = 4,
	YELLOW = 5
}
