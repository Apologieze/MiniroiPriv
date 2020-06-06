extends KinematicBody2D

var vel = Vector2()
var speed = 60
var compx = 0
var compy = 0
var animation = "idle_down"
var velation = vel
var direction = 3
var bumpy = 0
export var skin = 1

var idle_down
var idle_up
var idle_right
var run_down
var run_up
var run_right

onready var Anim = get_node("Anim")
onready var Fleche = get_node("Pivot")


func _ready():
	GLOBAL.palive += 1
	add_to_group("player")
	if skin == 1:
		idle_down = "idle_down1"
		idle_right = "idle_right1"
		idle_up = "idle_up1"
		run_down = "run_down1"
		run_right = "run_right1"
		run_up = "run_up1"
	
	elif skin == 2:
		idle_down = "idle_down2"
		idle_right = "idle_right2"
		idle_up = "idle_up2"
		run_down = "run_down2"
		run_right = "run_right2"
		run_up = "run_up2"	


	


func _physics_process(delta):
	if GLOBAL.player1life == false and visible == true:
		if GLOBAL.palive == 2:
			if GLOBAL.player2life == true:
				GLOBAL.plastalive = 2
		GLOBAL.palive -= 1
		visible = false
		$CollisionShape2D.disabled = true
	
	if GLOBAL.yplayer2 < position.y:
		z_index = 1
	else:
		z_index = 0
		
	mouvement_loop()
	GLOBAL.yplayer1 = position.y
	velation = vel.x + vel.y
	if velation == 0:
		if direction == 3:
			animation = idle_down
		elif direction == 1:
			animation = idle_up
		elif direction == 2:
			animation = idle_right	
			Anim.flip_h = false
		elif direction == 4:
			animation = idle_right
			Anim.flip_h = true
	else:
		if direction == 3:
			animation = run_down
		elif direction == 1:
			animation = run_up
		elif direction == 2:
			animation = run_right
			Anim.flip_h = false
		elif direction == 4:
			animation = run_right
			Anim.flip_h = true
	Anim.play(animation)
	
	move_and_slide(vel)
	if Input.is_action_just_pressed("ui_cancel"):
    	OS.window_fullscreen = !OS.window_fullscreen
		
	
func mouvement_loop():	 
	compx = 0
	
	
		
	if compy == 0:
		
		if Input.is_action_pressed("ui_right") and Input.is_action_pressed("ui_left"):
			vel.x = 0

		elif Input.is_action_pressed("ui_right"):
			vel.x = speed	
			compx += 1
			direction = 2
			Fleche.rotation_degrees = -90
		elif Input.is_action_pressed("ui_left"):
			vel.x = -speed
			compx += 1
			direction = 4
			Fleche.rotation_degrees = 90
		else:
			vel.x = 0
	
	compy = 0
	
	if compx == 0:
		
		if Input.is_action_pressed("ui_up") and Input.is_action_pressed("ui_down"):
			vel.y = 0
		
		elif Input.is_action_pressed("ui_up"):
			vel.y = -speed	
			compy +=1
			direction = 1
			Fleche.rotation_degrees = 180
		elif Input.is_action_pressed("ui_down"):
			vel.y = speed
			compy += 1
			direction = 3
			Fleche.rotation_degrees = 0
		else:
			vel.y = 0	
		
	if GLOBAL.player1bump > 0:
		if GLOBAL.player1bump == 1:
			if bumpy == 0:
				bumpy = -150
			vel.y = bumpy
			bumpy += 5
			if bumpy == -5:
				bumpy = 0
				GLOBAL.player1bump = 0
		if GLOBAL.player1bump == 3:
			if bumpy == 0:
				bumpy = 150
			vel.y = bumpy
			bumpy -= 5
			if bumpy == 5:
				bumpy = 0
				GLOBAL.player1bump = 0
		if GLOBAL.player1bump == 2:
			if bumpy == 0:
				bumpy = 150
			vel.x = bumpy
			bumpy -= 5
			if bumpy == 5:
				bumpy = 0
				GLOBAL.player1bump = 0
		if GLOBAL.player1bump == 4:
			if bumpy == 0:
				bumpy = -150
			vel.x = bumpy
			bumpy += 5
			if bumpy == -5:
				bumpy = 0
				GLOBAL.player1bump = 0
	

func _on_bump_body_entered(body):
	if GLOBAL.player1life == true:
		if vel.y + vel.x != 0:
			if body.is_in_group("player2"):
				if direction == 1:
					GLOBAL.player2bump = 1
				elif direction == 2:
					GLOBAL.player2bump = 2
				elif direction == 3:
					GLOBAL.player2bump = 3
				elif direction == 4:
					GLOBAL.player2bump = 4