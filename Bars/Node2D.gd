extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_pressed():
	$ProgressBarHP.value +=10


func _on_Button2_pressed():
	$ProgressBarHP.value -=10


func _on_MinusHP_pressed():
	Global.lose_life()


func _on_PlusHP_pressed():
	Global.plus_heart()
