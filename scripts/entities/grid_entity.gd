class_name GridEntity extends Node2D


var _tile_position: Vector2i


func get_tile_position() -> Vector2i:
	return _tile_position


func set_tile_position(position: Vector2i) -> void:
	_tile_position = position


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
