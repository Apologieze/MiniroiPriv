extends AnimatedSprite
var player = 0
var gauche = ""
var droite = ""
var selec = 1
var anim = "idle_down1"



# Called when the node enters the scene tree for the first time.
func _ready():
	playing = true
	player = z_index
	if player == 1:
		gauche = "ui_left"
		droite = "ui_right"
	if player == 2:
		gauche = "ui_left2"
		droite = "ui_right2"
	if player == 3:
		gauche = "ui_left3"
		droite = "ui_right3"
	if player == 4:
		gauche = "ui_left4"
		droite = "ui_right4"
		
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if visible == true:
		if Input.is_action_just_pressed(gauche):
			selec -= 1
			if selec == 0:
				selec = 4
		if Input.is_action_just_pressed(droite):
			selec += 1
			if selec == 5:
				selec = 1
				
		anim = ("idle_down"+str(selec))

	
func _on_selec1_frame_changed():
	var temp = 0
	if animation != anim:
		temp = frame
		animation = anim
		frame = temp

func _on_selec2_frame_changed():
	var temp = 0
	if animation != anim:
		temp = frame
		animation = anim
		frame = temp

func _on_selec3_frame_changed():
	var temp = 0
	if animation != anim:
		temp = frame
		animation = anim
		frame = temp
	
func _on_selec4_frame_changed():
	var temp = 0
	if animation != anim:
		temp = frame
		animation = anim
		frame = temp
