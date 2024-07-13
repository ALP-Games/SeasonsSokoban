class_name Player extends GridEntity


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# these are needed for input buffers
	# input buffer can be implemented later
	if Input.is_action_just_pressed(&"up"):
		#_current_tile_position
		pass
	elif Input.is_action_just_pressed(&"down"):
		pass
	elif Input.is_action_just_pressed(&"left"):
		pass
	elif Input.is_action_just_pressed(&"right"):
		pass
	
	# these are needed for moves
	Input.is_action_pressed(&"up")
	Input.is_action_pressed(&"down")
	Input.is_action_pressed(&"left")
	Input.is_action_pressed(&"right")
