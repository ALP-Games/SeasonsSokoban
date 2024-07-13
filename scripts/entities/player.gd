extends CharacterBody2D


const SPEED := 300.0
const JUMP_VELOCITY := -400.0


func _physics_process(delta):
	
	var input_dir := Input.get_vector("left", "right", "up", "down")
	
	velocity = input_dir * SPEED

	move_and_slide()
