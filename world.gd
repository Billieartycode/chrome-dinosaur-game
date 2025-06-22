extends Node2D

#grounds are scenes
@onready var ground_1: Node2D = $Ground1 
@onready var ground_2: Node2D = $Ground2
var width =12032.0 #ground width the grounds have tha same width
var score =0
var start = false
var speed = 100


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		start = true
	
	#grounds movement 
	if start == true :
		ground_1.position.x -= speed * delta
		ground_2.position.x -= speed * delta
	
	if ground_1.position.x < -width :
		$Ground1/guide.text =" "
		ground_1.position.x = ground_2.position.x + width
		
	if ground_2.position.x < -width :
		ground_2.position.x = ground_1.position.x + width


func _on_score_detect_body_entered(body: Node2D) -> void:
	score += 1
	$Dino/Camera2D/score.text = "score "+ str(score)    #display score on the lable
	speed += log(speed/2)    # speed increasing
