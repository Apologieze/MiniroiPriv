extends Node2D
#onready var text = get_node("Label")
onready var lancer = get_node("Lancer")
var selec = 2

onready var plus1 = $Addplayer1/plus1
onready var plus2 = $Addplayer2/plus2


func _ready():
	selec = GLOBAL.nb_player
	if selec > 2:
		plus1.visible = false
		plus2.visible = true
		$selec3.visible = true
	if selec == 4:
		plus2.visible = false
		$selec4.visible = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		OS.window_fullscreen = !OS.window_fullscreen
	if Input.is_action_just_pressed("ui_select"):
		lancement()
	if $Addplayer1.is_hovered():
		plus1.frame = 1
	else:
		plus1.frame = 2
	if $Addplayer1.is_pressed():
		plus1.frame = 0
		
	if $Addplayer2.is_hovered():
		plus2.frame = 1
	else:
		plus2.frame = 2
	if $Addplayer2.is_pressed():
		plus2.frame = 0


func _on_Lancer_pressed():
	lancement()
	
func lancement():
	GLOBAL.nb_player = selec
	print(GLOBAL.nb_player)
	GLOBAL.skin1 = $selec1.selec
	GLOBAL.skin2 = $selec2.selec
	GLOBAL.skin3 = $selec3.selec
	GLOBAL.skin4 = $selec4.selec
	get_tree().change_scene("res://scene/game.tscn")

func _on_Addplayer1_pressed():
	if selec == 2:
		selec += 1
		$selec3.visible = true
		plus1.visible = false
		plus2.visible = true
	elif selec == 3:
		selec -= 1
		$selec3.visible = false
		plus1.visible = true
		plus2.visible = false

func _on_Addplayer2_pressed():
	if selec == 3:
		selec += 1
		$selec4.visible = true
		plus2.visible = false
	elif selec == 4:
		selec -= 1
		$selec4.visible = false
		plus2.visible = true
