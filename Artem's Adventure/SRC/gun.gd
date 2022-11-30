extends Sprite

onready var player = get_tree().current_scene.get_node('PLAYER')
var can_fire = true
var rate_of_fire = 0.4
var bullet = preload("res://OBJ/BULLET.tscn")
var timer = Timer.new()

func _ready():
	timer.wait_time = 0.1
	timer.autostart = true
	add_child(timer)

func _physics_process(delta):
	flip_v = true if player.global_position.x < global_position.x else false

	if global_position.distance_to(player.global_position) < 600:
		look_at(player.global_position)
		if can_fire:
			#var bullet_instance = bullet.instance()
			#bullet_instance.rotation = rotation + rand_range(-0.1, 0.1)
			#bullet_instance.global_position = $muzzle.global_position
			#get_parent().add_child(bullet_instance)
			#can_fire = false
			#yield(timer, "timeout")
			#can_fire = true
			new_fire()
	

func new_fire():
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
