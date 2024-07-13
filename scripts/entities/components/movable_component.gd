class_name MoveableComponent extends Component

enum MoveDirection {
	NONE,
	UP,
	DOWN,
	LEFT,
	RIGHT
}

var _next_tile_position: Vector2i
var _position_updating: bool = false


static func component_name() -> StringName:
	return &"MoveableComponent"


func try_move(direction: MoveDirection) -> bool:
	if _position_updating: # have to wait to finish movement
		return false
	
	var desired_position: Vector2i
	var can_move: bool = false
		
	if direction == MoveDirection.UP:
		desired_position = Vector2i(_owner.get_tile_position().x, _owner.get_tile_position().y + 1)
	elif direction == MoveDirection.DOWN:
		desired_position = Vector2i(_owner.get_tile_position().x, _owner.get_tile_position().y - 1)
	elif direction == MoveDirection.LEFT:
		desired_position = Vector2i(_owner.get_tile_position().x - 1, _owner.get_tile_position().y)
	elif direction == MoveDirection.RIGHT:
		desired_position = Vector2i(_owner.get_tile_position().x + 1, _owner.get_tile_position().y)
	
	# there could be a seperate function to check for can_move?
	# if desired_position is avalible can_move is true
	can_move = true
	
	if not can_move:
		return false
	
	_next_tile_position = desired_position
	_position_updating = true
	return true


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# here we need to do the updating
	pass
