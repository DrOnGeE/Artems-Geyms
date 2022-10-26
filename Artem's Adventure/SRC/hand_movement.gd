extends KinematicBody2D

export (int) var speed = 3000

var velocity = Vector2()

func _ready():
	self.show()

func _process(delta):
	velocity = Vector2()
	if Input.is_action_pressed("hand_activate"):
		self.show()
		look_at(get_global_mouse_position())
		velocity = Vector2(speed, 0).rotated(rotation)

func _unhandled_input(event):
	self.show()

func _physics_process(delta):
	velocity = move_and_slide(velocity)
