extends KinematicBody2D

export (int) var speed = 1000

var velocity = Vector2()
var pre_position = position
var hand_vision = 1

#var bullet_speed = 2000
var bullet = preload("res://OBJ/BULLET.tscn")
var can_fire = true
var rate_of_fire = 0.4

func _ready():
	self.hide()
	#self.show()
	pass
	
func _unhandled_input(event):
	self.hide()
	#self.show()
	pass

func _process(delta):
	velocity = Vector2()
	ControlLoop()
	pass
	

func _physics_process(delta):	
	velocity = move_and_slide(velocity)
	pass

func ControlLoop():
	look_at(get_global_mouse_position())
	if Input.is_action_just_pressed("hand_activate"):
		pre_position = position
		#print("pressed")
	if Input.is_action_pressed("hand_activate"):
		self.show()
		can_fire = false
		velocity = Vector2(speed, 0).rotated(rotation)
	if Input.is_action_pressed("hand_shoot") and can_fire == true:
		can_fire = false
		HandVision()
		Fire()
		yield(get_tree().create_timer(rate_of_fire), "timeout")
		can_fire = true
	if Input.is_action_just_released("hand_activate"):
		position = pre_position
		can_fire = true
		#print("released")
	
	pass

func HandVision():
	self.show()
	yield(get_tree().create_timer(hand_vision), "timeout")
	self.hide()

func Fire():
	get_node("TurnAxis/BulletPoint").rotation = get_angle_to(get_global_mouse_position())
	var bullet_instance = bullet.instance()
	bullet_instance.position = get_node("TurnAxis/BulletPoint").get_global_position()
	bullet_instance.rotation_degrees = rotation_degrees
	get_tree().get_root().call_deferred("add_child", bullet_instance)
	pass
