extends CharacterBody2D


const JUMP_VELOCITY = -400.0
var start = false

func _ready() -> void:
	pass



func _physics_process(delta: float) -> void:
	
	if Input.is_action_just_pressed("ui_select"):
		start =true

	# Add the gravity.
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
		#$"dino animation".play("jump")

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	#var direction := Input.get_axis("ui_left", "ui_right")
	#if direction:
	#	velocity.x = direction * SPEED
	#else:
	#	velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

func dino():
	pass


func _on_dino_body_body_entered(body: Node2D) -> void:
	#if body.has_method("cactus"):
	$"dino animation".play("outch")
