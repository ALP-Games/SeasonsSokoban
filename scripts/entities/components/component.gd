class_name Component extends Node

var _owner: GridEntity = null


static func component_name() -> StringName:
	assert(false, "component_name should be overriden by component!")
	return &""


func _enter_tree() -> void:
	_owner = owner
	owner.set_meta(component_name(), self)


func _exit_tree() -> void:
	owner.remove_meta(component_name())
