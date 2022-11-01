extends KinematicBody2D

export (int) var speed = 1000
export (int) var move_back_speed = 200

var velocity = Vector2()
var pre_position = position

func _ready():
	self.hide()
	#self.show()
	#pre_position = position

func _process(delta):
	velocity = Vector2()
	look_at(get_global_mouse_position())
	#if(position != pre_position):
	#	velocity = Vector2(-move_back_speed, 0)
	#	print(position, "\t", pre_position)
	if Input.is_action_just_pressed("hand_activate"):
		pre_position = position
		#print("pressed")
	if Input.is_action_pressed("hand_activate"):
		self.show()
		velocity = Vector2(speed, 0).rotated(rotation)
		
	if Input.is_action_just_released("hand_activate"):
		position = pre_position
		#print("released")

func _unhandled_input(event):
	self.hide()
	#self.show()

func _physics_process(delta):
	velocity = move_and_slide(velocity)


func _on_Area2D_mouse_entered():
	#print("got it")
	pass

func _on_Area2D_mouse_exited():
	#print("well")
	pass
