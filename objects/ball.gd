class_name Ball
extends CharacterBody2D

signal lost

@export var random_angle_offset_min = -20
@export var random_angle_offset_max = 20
@export var up_angle_range_min = -45
@export var up_angle_range_max = 45
@export var speed = 75

var _angle = 0

func _ready():
	_angle = _get_random_up_angle()
	print(_angle)

func _physics_process(delta):
	var movement = Vector2.UP.rotated(_angle) * speed * delta
	var collission = self.move_and_collide(movement)
	if collission == null:
		return
	
	var collider = collission.get_collider()
	_angle = _get_bounce_angle(_angle, collission.get_angle(Vector2.RIGHT))
	
	if collider is Block:
		var block = collider as Block
		block.hit()

func delete():
	print("Lost")
	lost.emit()
	queue_free()

func _get_random_up_angle() -> float:
	var rand = randf()
	var angle = lerp(up_angle_range_min, up_angle_range_max, rand)
	return deg_to_rad(angle)

func _get_bounce_angle(incoming_angel: float, collision_angle: float) -> float:
	# Taken from https://stackoverflow.com/a/64421233/11130470
	var angle = 2 * collision_angle - incoming_angel
	var offset = randf_range(random_angle_offset_min, random_angle_offset_max)
	return angle + deg_to_rad(offset)
