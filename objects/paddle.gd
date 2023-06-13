class_name Paddle
extends AnimatableBody2D

@export var speed = 200

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _physics_process(delta):
	var direction = 0
	direction -= Input.get_action_strength("Paddle Left")
	direction += Input.get_action_strength("Paddle Right")
	
	var movement = direction * speed * delta
	self.move_and_collide(Vector2(movement, 0))
	
