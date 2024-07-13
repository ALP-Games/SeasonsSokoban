class_name GridEntity extends Node2D

var _entity_container: EntityContainer = null
var _tile_position: Vector2i


func set_entity_container(entity_container: EntityContainer) -> void:
	_entity_container = entity_container


func get_entity_container() -> EntityContainer:
	return _entity_container


func set_tile_position(position: Vector2i) -> void:
	_tile_position = position


func get_tile_position() -> Vector2i:
	return _tile_position


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
