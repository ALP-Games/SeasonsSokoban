class_name MoveableComponent extends Component

const MOVE_MARGIN: float = 0.1

enum MoveDirection {
	NONE,
	UP,
	DOWN,
	LEFT,
	RIGHT
}

@export var speed: float = 50.0

var _next_tile_position: Vector2i
var _next_global_position: Vector2
var _position_updating: bool = false


static func component_name() -> StringName:
	return &"MoveableComponent"


func try_move(direction: MoveDirection) -> bool:
	if _position_updating: # have to wait to finish movement
		return false
	
	var desired_position: Vector2i
	var can_move: bool = false
		
	if direction == MoveDirection.UP:
		desired_position = Vector2i(_owner.get_tile_position().x, _owner.get_tile_position().y - 1)
	elif direction == MoveDirection.DOWN:
		desired_position = Vector2i(_owner.get_tile_position().x, _owner.get_tile_position().y + 1)
	elif direction == MoveDirection.LEFT:
		desired_position = Vector2i(_owner.get_tile_position().x - 1, _owner.get_tile_position().y)
	elif direction == MoveDirection.RIGHT:
		desired_position = Vector2i(_owner.get_tile_position().x + 1, _owner.get_tile_position().y)
	
	# there could be a seperate function to check for can_move?
	# if desired_position is avalible can_move is true
	var entity_container := _owner.get_entity_container()
	_next_global_position = entity_container.move_entity(_owner, desired_position)
	can_move = true
	
	if not can_move:
		return false
	
	_next_tile_position = desired_position
	_position_updating = true
	return true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta) -> void:
	_update_position(delta)
	pass


func _update_position(delta) -> void:
	if not _position_updating:
		return
	var move_direction: = Vector2(_next_tile_position - _owner.get_tile_position()).normalized()
	var position_delta: Vector2 = move_direction * delta * speed
	_owner.global_position += position_delta
	
	if (_next_global_position - _owner.global_position).normalized() != move_direction:
		_owner.global_position = _next_global_position
		_owner.set_tile_position(_next_tile_position)
		_position_updating = false
	
