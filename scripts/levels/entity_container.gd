class_name EntityContainer extends Node2D

# needs to find the player
var _game_world: GameWorld = null
var _player: Player

# also need to create a dictionary of entities based on positions
func ready(world: GameWorld) -> void:
	_game_world = world
	for entity: GridEntity in get_children():
		var map_pos := _game_world.local_to_map(entity.global_position)
		entity.set_tile_position(map_pos)
		# map_pos should be saved to a map for entities
		# and it should be saved for the entity also
		var global_pos := _game_world.map_to_local(map_pos)
		entity.global_position = global_pos


# Called when the node enters the scene tree for the first time.
#func _ready() -> void:
	#pass
