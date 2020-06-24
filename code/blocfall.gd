extends AnimatedSprite

onready var node2 = get_node("..")
var vague = false
var choix = 0
var dedans1 = false
var dedans2 = false
var dedans3 = false
var dedans4 = false
var tomber = true
var luck = 15



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if GLOBAL.plastalive == 0:
		if node2.pulse == false:
			if tomber == true:
				if vague == false:
					vague = true
					randomize()
					choix = randi()%luck+1
					if choix == luck:
						GLOBAL.nbfall += 1
					if GLOBAL.nbfall > 5:
						choix = 30
					if GLOBAL.nbfall < 2:
						vague = false
					
					if choix == luck:
							if choix == luck:
								play("fall")
								yield(get_tree().create_timer(1.0), "timeout")
								tomber = false
								play("lava")
								playing = false
								choix = 0
								if dedans1 == true:
									GLOBAL.player1life = false
								if dedans2 == true:
									GLOBAL.player2life = false
								if dedans3 == true:
									GLOBAL.player3life = false
								if dedans4 == true:
									GLOBAL.player4life = false
							GLOBAL.nbfall = 0
		else:
			vague = false

func _on_Area2D_body_entered(body):
	if body.is_in_group("player"):
		dedans1 = true
		if tomber == false:
			GLOBAL.player1life = false
	if body.is_in_group("player2"):
		dedans2 = true
		if tomber == false:
			GLOBAL.player2life = false
	if body.is_in_group("player3"):
		dedans3 = true
		if tomber == false:
			GLOBAL.player3life = false
	if body.is_in_group("player4"):
		dedans4 = true
		if tomber == false:
			GLOBAL.player4life = false

func _on_Area2D_body_exited(body):
	if body.is_in_group("player"):
		dedans1 = false
	if body.is_in_group("player2"):
		dedans2= false
	if body.is_in_group("player3"):
		dedans3= false	
	if body.is_in_group("player4"):
		dedans4= false	
