extends Node
var nb_player = 2

var player1life = true
var player2life = true
var player3life = true
var player4life = true

var palive = 0
var plastalive = 0 

var player1bump = 0
var player2bump = 0
var player3bump = 0
var player4bump = 0
var lastplayerbump = 0
var templast = 0

var skin1 = 0
var skin2 = 0
var skin3 = 0
var skin4 = 0

#var yplayer1 = 0
#var yplayer2 = 0
#var yplayer3 = 0
#
#var index1 = 0
#var index2 = 0
#var index3 = 0

var nbfall = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if Input.is_action_just_pressed("ui_restart"):
		get_tree().change_scene("res://scene/Menu2.tscn")
		player1life = true
		player2life = true
		player3life = true
		player4life = true
		palive = 0
		plastalive = 0
#	print(GLOBAL.lastplayerbump)

#	if plastalive > 0:
#		print(plastalive)
##		plastalive = 0
		
#	if nb_player == 2:
#		if yplayer2 < yplayer1:
#			index1 = 1
#			index2 = 0
#		else:
#			index1 = 0
#			index2 = 1
			
#	if nb_player == 3:
##		print("joueur1: ", yplayer1, "   ", "joueur2: ", yplayer2,"   ", "joueur3: ", yplayer3, "  ", index1,index2,index3)
#		if yplayer1 > yplayer2:
#			if yplayer3 > yplayer1:
#				index3 = 2
#				index1 = 1
#				index2 = 0
#			else:
#				if yplayer2 > yplayer3:
#					index3 = 0
#					index1 = 2
#					index2 = 1
#				else:
#					index2 = 0
#					index3 = 1
#					index1 = 2
#
#		else:
#			if yplayer3 > yplayer2:
#				index1 = 0
#				index2 = 1
#				index3 = 2
#			else:
#				if yplayer3 > yplayer1:
#					index1 = 0
#					index3 = 1
#					index2 = 2
#				else:
#					index3 = 0
#					index1 = 1
#					index2 = 2
				
	if lastplayerbump > 0:
		if templast == 0:
			templast = lastplayerbump
			yield(get_tree().create_timer(0.1), "timeout")
			if lastplayerbump == templast:
				lastplayerbump = 0
				templast = 0
			
					
				
