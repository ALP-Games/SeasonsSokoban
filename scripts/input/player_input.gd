class_name PlayerInput extends Node

var _controllables: Array[ControllableComponent]


func add_controllable(controllable: ControllableComponent) -> void:
	_controllables.append(controllable)


func remove_controllable(controllable: ControllableComponent) -> void:
	var index = 0
	for component in _controllables:
		if component == controllable:
			_controllables.remove_at(index)
			return
		index += 1


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# this will be used to buffer inputs
	var snap_direction := MoveableComponent.MoveDirection.NONE
	if Input.is_action_just_pressed(&"up"):
		snap_direction = MoveableComponent.MoveDirection.UP
	elif Input.is_action_just_pressed(&"down"):
		snap_direction = MoveableComponent.MoveDirection.DOWN
	elif Input.is_action_just_pressed(&"left"):
		snap_direction = MoveableComponent.MoveDirection.LEFT
	elif Input.is_action_just_pressed(&"right"):
		snap_direction = MoveableComponent.MoveDirection.RIGHT
	
	if snap_direction != MoveableComponent.MoveDirection.NONE:
		for controllable in _controllables:
			controllable.try_move(snap_direction)
		
	
	# these are needed for hold moves
	#Input.is_action_pressed(&"up")
	#Input.is_action_pressed(&"down")
	#Input.is_action_pressed(&"left")
	#Input.is_action_pressed(&"right")
