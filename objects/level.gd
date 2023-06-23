class_name Level
extends Node2D

signal score_changed(score)
signal done()

var _score = 0
var _blocks = []

# Called when the node enters the scene tree for the first time.
func _ready():
	for child in get_children():
		if child is Block:
			var block = child as Block
			block.destroyed.connect(_block_destroyed)
			_blocks.push_back(block)

func _block_destroyed(block: Block, value: int):
	_score += value
	_blocks.erase(block)
	score_changed.emit(_score)
	
	if _blocks.is_empty():
		done.emit()
