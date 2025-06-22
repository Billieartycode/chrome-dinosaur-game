extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func cactus():
	pass


func _on_cactus_area_body_entered(body: Node2D) -> void:
	if body.has_method("dino"): #if body have fuction named dino
		get_tree().reload_current_scene()#reload the main scene (restart)
		
