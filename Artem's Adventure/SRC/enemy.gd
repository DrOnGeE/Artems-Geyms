extends KinematicBody2D

var speed = 0
onready var tilemap = get_tree().current_scene.get_node("TileMap")
var flip = false
var move = Vector2(speed, 0)
var hitpoints = 4
var has_gun = true

func _ready():
	if !has_gun:
		$gun.queue_free()

func dir_changed():
	flip = !flip
	$AnimatedSprite.flip_h = flip
	$AnimatedSprite.play("Walk")
	$obj_detected.rotation_degrees = 180 if flip else 0
	move.x *= -1

func _physics_process(delta):
	if not is_on_floor():
		move.y += 10
	if !flip:
		var tile = tilemap.world_to_map(global_position + Vector2(16,32))
		check_wall(tile)
	else:
		var tile = tilemap.world_to_map(global_position + Vector2(-16,32))
		check_wall(tile)
	
	move_and_slide(move, Vector2.UP)

func check_wall(tile):
	var tile_info = tilemap.get_cellv(tile)
	if tile_info == -1:
		dir_changed()



func _on_obj_detected_body_entered(body):
	dir_changed()


func _on_hurtbox_area_entered(area):
		if area.is_in_group("BULLET"):
			hitpoints -= 1
			if hitpoints == 0:
				
				queue_free()
