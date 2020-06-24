extends KinematicBody2D

var vel = Vector2()
var speed = 60
var compx = 0
var compy = 0
var animation = "idle_down"
var velation = vel
var direction = 3
var bumpy = 0
var tempbump = 0
var skin = 1


var idle_down
var idle_up
var idle_right
var run_down
var run_up
var run_right
var victoire 

onready var Anim = get_node("Anim")
onready var Fleche = get_node("Pivot")
onready var Colision = get_node("CollisionShape2D")

func _ready():
	skin = GLOBAL.skin4
	if GLOBAL.nb_player == 2 or GLOBAL.nb_player == 3:
		visible = false
		position.x = 0
		position.y = 0
		GLOBAL.player4life = false
	else:
		GLOBAL.palive += 1
		add_to_group("player4")
		if skin == 1:
			idle_down = "idle_down1"
			idle_right = "idle_right1"
			idle_up = "idle_up1"
			run_down = "run_down1"
			run_right = "run_right1"
			run_up = "run_up1"
			victoire = "victoire_1"
		
		elif skin == 2:
			idle_down = "idle_down2"
			idle_right = "idle_right2"
			idle_up = "idle_up2"
			run_down = "run_down2"
			run_right = "run_right2"
			run_up = "run_up2"	
			victoire = "victoire_2"
		
		elif skin == 3:
			idle_down = "idle_down3"
			idle_right = "idle_right3"
			idle_up = "idle_up3"
			run_down = "run_down3"
			run_right = "run_right3"
			run_up = "run_up3"		
			victoire = "victoire_3"
		
		elif skin == 4:
			idle_down = "idle_down4"
			idle_right = "idle_right4"
			idle_up = "idle_up4"
			run_down = "run_down4"
			run_right = "run_right4"
			run_up = "run_up4"	
			victoire = "victoire_4"




func _physics_process(delta):
	if GLOBAL.player4life == false and visible == true:
		GLOBAL.palive -= 1
		if GLOBAL.palive == 1:
			if GLOBAL.player1life == true:
				GLOBAL.plastalive = 1
			if GLOBAL.player2life == true:
				GLOBAL.plastalive = 2
			if GLOBAL.player3life == true:
				GLOBAL.plastalive = 3
			print("Winner", GLOBAL.plastalive)
		if GLOBAL.plastalive != 4:
			visible = false
			$CollisionShape2D.disabled = true
	
#	z_index = GLOBAL.index3
	
	if GLOBAL.nb_player > 3:
		if GLOBAL.plastalive == 4:
			Anim.play(victoire)
		else:
			mouvement_loop()
			velation = vel.x + vel.y
			if velation == 0:
				if direction == 3:
					animation = idle_down
					Anim.flip_h = false
				elif direction == 1:
					animation = idle_up
					Anim.flip_h = false
				elif direction == 2:
					animation = idle_right
					Anim.flip_h = false
				elif direction == 4:
					animation = idle_right
					Anim.flip_h = true
			else:
				if direction == 3:
					animation = run_down
					Anim.flip_h = false
				elif direction == 1:
					animation = run_up
					Anim.flip_h = false
				elif direction == 2:
					animation = run_right
					Anim.flip_h = false
				elif direction == 4:
					animation = run_right
					Anim.flip_h = true
			Anim.play(animation)
			
			move_and_slide(vel)
	
		
	
func mouvement_loop():	

 
	compx = 0
	
		
	if compy == 0:
		
		if Input.is_action_pressed("ui_right4") and Input.is_action_pressed("ui_left4"):
			vel.x = 0

		elif Input.is_action_pressed("ui_right4"):
			vel.x = speed	
			compx += 1
			direction = 2

			Fleche.rotation_degrees = -90
			Colision.rotation_degrees = -90
		elif Input.is_action_pressed("ui_left4"):
			vel.x = -speed
			compx += 1
			direction = 4
			Fleche.rotation_degrees = 90
			Colision.rotation_degrees = 90
		else:
			vel.x = 0
	
	compy = 0
	
	if compx == 0:
		
		if Input.is_action_pressed("ui_up4") and Input.is_action_pressed("ui_down4"):
			vel.y = 0
		
		elif Input.is_action_pressed("ui_up4"):
			vel.y = -speed	
			compy +=1
			direction = 1
			Fleche.rotation_degrees = 180
			Colision.rotation_degrees = 180
		elif Input.is_action_pressed("ui_down4"):
			vel.y = speed
			compy += 1
			direction = 3
			Fleche.rotation_degrees = 0
			Colision.rotation_degrees = 0
		else:
			vel.y = 0	
		
	if bumpy > 150 or bumpy < -150:
		bumpy = 0	
		
	if GLOBAL.player4bump > 0:
		if GLOBAL.player4bump != tempbump:
			bumpy = 0
		if GLOBAL.player4bump == 1:
			if bumpy == 0:
				bumpy = -150
			vel.y = bumpy
			bumpy += 5
			if bumpy == -5:
				bumpy = 0
				GLOBAL.player4bump = 0
		if GLOBAL.player4bump == 3:
			if bumpy == 0:
				bumpy = 150
			vel.y = bumpy
			bumpy -= 5
			if bumpy == 5:
				bumpy = 0
				GLOBAL.player4bump = 0
		if GLOBAL.player4bump == 2:
			if bumpy == 0:
				bumpy = 150
			vel.x = bumpy
			bumpy -= 5
			if bumpy == 5:
				bumpy = 0
				GLOBAL.player4bump = 0
		if GLOBAL.player4bump == 4:
			if bumpy == 0:
				bumpy = -150
			vel.x = bumpy
			bumpy += 5
			if bumpy == -5:
				bumpy = 0
				GLOBAL.player4bump = 0
		tempbump = GLOBAL.player4bump
	


func _on_bump_body_entered(body):
	if GLOBAL.player4life == true:
		if vel.y + vel.x != 0:
			if body.is_in_group("player"):
				if GLOBAL.player4bump > 0 and GLOBAL.lastplayerbump != 1:
					GLOBAL.player1bump = GLOBAL.player4bump
				else:
					if direction == 1:
						GLOBAL.player1bump = 1
					elif direction == 2:
						GLOBAL.player1bump = 2
					elif direction == 3:
						GLOBAL.player1bump = 3
					elif direction == 4:
						GLOBAL.player1bump = 4
				GLOBAL.lastplayerbump = 4
					
			if body.is_in_group("player2"):
				if GLOBAL.player4bump > 0 and GLOBAL.lastplayerbump != 2:
					GLOBAL.player2bump = GLOBAL.player4bump
				else:
					if direction == 1:
						GLOBAL.player2bump = 1
					elif direction == 2:
						GLOBAL.player2bump = 2
					elif direction == 3:
						GLOBAL.player2bump = 3
					elif direction == 4:
						GLOBAL.player2bump = 4
				GLOBAL.lastplayerbump = 4
			
			if body.is_in_group("player3"):
				if GLOBAL.player4bump > 0 and GLOBAL.lastplayerbump != 3:
					GLOBAL.player3bump = GLOBAL.player4bump
				else:
					if direction == 1:
						GLOBAL.player3bump = 1
					elif direction == 2:
						GLOBAL.player3bump = 2
					elif direction == 3:
						GLOBAL.player3bump = 3
					elif direction == 4:
						GLOBAL.player3bump = 4
				GLOBAL.lastplayerbump = 4
