class_name Player_Non_Tiled extends CharacterBody2D

const SPEED := 300.0
const JUMP_VELOCITY := -400.0

@export var input_hold_time: float = 0.15 # maybe we don't even need the hold time, we don't have rotations
@export var move_speed: float = 1.0

# need to get the tile map
# current in the beggining has to be retrieved from tile map and set
var current_even_pos: Vector2
# when setting new pos, we have to check with the tile map if there is an obstacle
var new_even_pos: Vector2
var position_updating: bool = false


func _physics_process(delta):
	# these are needed for input buffers
	Input.is_action_just_pressed("up")
	Input.is_action_just_pressed("down")
	Input.is_action_just_pressed("left")
	Input.is_action_just_pressed("right")
	
	# these are needed for moves
	Input.is_action_pressed("up")
	Input.is_action_pressed("down")
	Input.is_action_pressed("left")
	Input.is_action_pressed("right")
	
	var input_dir := Input.get_vector("left", "right", "up", "down")
	velocity = input_dir * SPEED

	move_and_slide()
