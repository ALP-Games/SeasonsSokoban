class_name GameWorld extends TileMap

var _entity_container: EntityContainer = null

# Called when the node enters the scene tree for the first time.
func _ready():
	for child in get_children():
		if child is EntityContainer:
			_entity_container = child
			_entity_container.ready(self)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
