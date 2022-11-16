extends KinematicBody2D
class_name Player

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
	if velocity.x == 0:
		$AnimatedSprite.play("staying")
		
func _physics_process(delta):
	get_input()
	velocity.y += gravity * delta
	velocity = move_and_slide(velocity, Vector2.UP)
	if Input.is_action_just_pressed("player_jump"):
		if is_on_floor():
			velocity.y = jump_speed


func player_die():
#	SoundPlayer.play_sound(SoundPlayer.HURT)
	queue_free()
#	Events.emit_signal("player_died")
	
