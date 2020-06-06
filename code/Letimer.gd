extends Node2D
var pulse = true
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	time1()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

	
func time1():
	yield(get_tree().create_timer(4.0), "timeout")
	pulse = false
	yield(get_tree().create_timer(0.2), "timeout")
	pulse = true
	time1()
	


