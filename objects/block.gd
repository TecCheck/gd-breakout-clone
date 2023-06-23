@tool
class_name Block
extends StaticBody2D

signal destroyed(block: Block, value: int)

@export var value = 1
@export var health = 1
@export var color = BlockColor.BLUE:
	get:
		return color
	set(value):
		_set_color(value)
		color = value

# Called when the node enters the scene tree for the first time.
func _ready():
	_set_color(color)

func _set_color(color: BlockColor):
	$Sprite2D.frame = color

func hit():
	health = health - 1
	
	if health <= 0:
		destroyed.emit(self, value)
		queue_free()

enum BlockColor {
	BLUE = 0,
	ORANGE = 1,
	GREEN = 2,
	RED = 3,
	PURPLE = 4,
	YELLOW = 5
}
