extends Area2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Bordure_body_entered(body):
	if body.is_in_group("player"):
		GLOBAL.player1life = false
	if body.is_in_group("player2"):
		GLOBAL.player2life = false
	if body.is_in_group("player3"):
		GLOBAL.player3life = false
	if body.is_in_group("player4"):
		GLOBAL.player4life = false
		
