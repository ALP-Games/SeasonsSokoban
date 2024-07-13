class_name ControllableComponent extends Component


static func component_name() -> StringName:
	return &"ControllableComponent"


func _enter_tree():
	super()
	player_input.add_controllable(self)


func _exit_tree():
	super()
	player_input.remove_controllable(self)


func try_move(direction: MoveableComponent.MoveDirection) -> bool:
	var movable: MoveableComponent = owner.get_meta(MoveableComponent.component_name())
	if not movable:
		return false
	return movable.try_move(direction)
