extends KinematicBody2D

export (int) var speed = 800
export (int) var jump_speed = -1800
export (int) var gravity = 4000

var velocity = Vector2.ZERO

func get_input():
	velocity.x = 0
	if Input.is_action_pressed("player_right"):
		velocity.x += speed
		$AnimatedSprite.play("walk")
		$AnimatedSprite.flip_h = false
	if Input.is_action_pressed("player_left"):
		velocity.x -= speed
		$AnimatedSprite.play("walk")
		$AnimatedSprite.flip_h = true
	#if Input.is_action_pressed("hand_activate"):
		#shoot()
	if velocity.x == 0:
		$AnimatedSprite.play("staying")
		
func _physics_process(delta):
	get_input()
	velocity.y += gravity * delta
	velocity = move_and_slide(velocity, Vector2.UP)
	if Input.is_action_just_pressed("player_jump"):
		if is_on_floor():
			velocity.y = jump_speed

#const bulletPath = preload('res://OBJ/HAND.tscn')
#func shoot():
#	var bullet = bulletPath.instance()
#	
#	get_parent().add_child(bullet)
#	bullet.position = self.position
#	
#	bullet.velocity = get_global_mouse_position() - bullet.position
