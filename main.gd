extends Node2D

signal score_changed(value: int)

var _score = 0

func _on_level_done():
	print("Level done")

func _on_level_score_changed(score: int):
	_score = score
	score_changed.emit(_score)
