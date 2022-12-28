extends Area2D


func _on_Ship_body_entered(body):
	body.ApplyDMG(100)
