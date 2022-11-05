extends KinematicBody2D

export (int) var speed = 2

var velocity = Vector2()
var direction
var move = false

func get_input():
	#look_at(get_global_mouse_position())
	velocity = Vector2()
	if Input.is_action_pressed("ui_down"):
		velocity = Vector2(-speed, 0).rotated(rotation)
	if Input.is_action_pressed("ui_up"):
		velocity = Vector2(speed, 0).rotated(rotation)
	if (get_global_mouse_position() - global_position).length() < 1:
		velocity = Vector2.ZERO
	if Input.is_action_just_pressed("ui_right"):
		direction = get_global_mouse_position()
		move = true
		pass
	if Input.is_action_pressed("ui_left"):
		look_at(direction)
		#rotation = get_angle_to(get_global_mouse_position())
		#rotation_degrees = get_angle_to(get_global_mouse_position())
		velocity = Vector2(speed, 0).rotated(rotation)
		position += velocity
		#apply_impulse(Vector2(), Vector2(speed, 0).rotated(rotation))
		pass

func _physics_process(delta):
	if(move == true):
		#look_at(direction)
		velocity = Vector2(speed, 0).rotated(rotation)
		position+=velocity
	get_input()
	
func _process(delta):
	pass
