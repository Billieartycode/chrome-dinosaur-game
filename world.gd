extends Node2D

var speed = 400 
@onready var ground_1: Node2D = $Ground1
@onready var ground_2: Node2D = $Ground2
var width =12032.0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	ground_1.position.x -= speed * delta
	ground_2.position.x -= speed * delta
	
	if ground_1.position.x < -width :
		ground_1.position.x = ground_2.position.x + width
		
	if ground_2.position.x < -width :
		ground_2.position.x = ground_1.position.x + width
