extends KinematicBody2D

export (int) var gravity = 4000
export (int) var speed = 200
export (int) var jump_speed = -1800

var direction = Vector2.RIGHT
var velocity = Vector2.ZERO

onready var ledgeCheckRight: = $LedgeCheckRight
onready var ledgeCheckLeft: = $LedgeCheckLeft
onready var sprite: = $AnimatedSprite

func _physics_process(delta):
	var found_wall = is_on_wall()
	var found_ledge = not ledgeCheckRight.is_colliding() or not ledgeCheckLeft.is_colliding()
	
	if found_wall:
		velocity.y = jump_speed # now tehy can jump O_o
		direction *= -1
	
	sprite.flip_h = direction.x > 0
	$AnimatedSprite.play("default")
	velocity.x = 0
	velocity.x += speed * direction.x
	velocity.y += gravity * delta
	velocity = move_and_slide(velocity, Vector2.UP)
	
	#velocity = move_and_slide(velocity, Vector2.UP)
	#velocity = direction * 25
	#move_and_slide(velocity, Vector2.UP)
