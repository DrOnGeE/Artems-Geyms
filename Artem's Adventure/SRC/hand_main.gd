extends KinematicBody2D

export (int) var speed = 10

var velocity = Vector2()
var pre_position = position
var hand_vision = 1

var can_move = false
var direction

#bullet
var bullet = preload("res://OBJ/BULLET.tscn")
var can_fire = true
var rate_of_fire = 0.4
#######

func _ready():
	self.hide()
	#self.show()
	pre_position = position
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
	#velocity = move_and_slide(velocity)
	if (can_move == true):
		Move()
	pass

func ControlLoop():
	if (can_move == false):
		look_at(get_global_mouse_position())
		
	if Input.is_action_just_pressed("hand_activate"):
		#pre_position = position
		direction = get_global_mouse_position()
		look_at(direction)
		can_move = true
		can_fire = false
		position = get_parent().get_node("custom_player").position
		pass
		
	if Input.is_action_pressed("hand_activate"):
		direction = get_global_mouse_position()
		look_at(direction)
		pass


#FIRE
	if Input.is_action_pressed("hand_shoot") and can_fire == true:
		#can_fire = false
		#HandVision()
		Fire()
		#yield(get_tree().create_timer(rate_of_fire), "timeout")
		#can_fire = true
		pass
	if Input.is_action_just_released("hand_activate"):
		#position = pre_position
		can_fire = true
		#print("released")
		pass
	pass

func Move():
	velocity = Vector2(speed, 0).rotated(rotation)
	position+=velocity
	self.show()
	pass

func HandVision():
	self.show()
	yield(get_tree().create_timer(hand_vision), "timeout")
	self.hide()

func Fire():
	can_fire = false
	#########
	get_node("TurnAxis/BulletPoint").rotation = get_angle_to(get_global_mouse_position())
	var bullet_instance = bullet.instance()
	bullet_instance.position = get_node("TurnAxis/BulletPoint").get_global_position()
	bullet_instance.rotation_degrees = rotation_degrees
	get_tree().get_root().call_deferred("add_child", bullet_instance)
	#########
	yield(get_tree().create_timer(rate_of_fire), "timeout")
	can_fire = true
	pass

func _on_HandLimits_area_entered(area):
	#print("area")
	can_move = false
	position = pre_position
	pass # Replace with function body.


func _on_HandLimits_area_exited(area):
	#can_fire = true
	pass # Replace with function body.
