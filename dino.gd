extends CharacterBody2D


const JUMP_VELOCITY = -400.0
var start = false

func _ready() -> void:
	pass



func _physics_process(delta: float) -> void:
	# to turn start ON 
	if Input.is_action_just_pressed("ui_select"):
		start =true

	#game animations
	if start == true :
		$"dino animation".play("run")
	else :
		$"dino animation".play("idle")
	if not is_on_floor():
		$"dino animation".play("jump")
		velocity += get_gravity() * delta
		

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		
		velocity.y = JUMP_VELOCITY
		
	move_and_slide()
	
#to define the body with this func
func dino():
	pass

#to play die animation
func _on_dino_body_body_entered(body: Node2D) -> void:
	if body.has_method("cactus"):
		$"dino animation".play("outch")
