extends TileMap


var level = [
	[1, 1, 1, 1, 1],
	[1, 0, 0, 0, 1],
	[1, 0, 0, 0, 1],
	[1, 0, 0, 0, 1],
	[1, 1, 1, 1, 1],
]
var tile = 64
#var levelSize = level.size()
# Called when the node enters the scene tree for the first time.
func _ready():
	Generate_Tilemap()


func Generate_Tilemap():
	for y in range(level.size()):
		for x in range(level[y].size()): #level[y].size()
			Create_Tile(level[y][x], x, y)

func Create_Tile(tileType, x, y):
	match tileType:
		0:
			set_cell(0, Vector2i(x,y), 0, Vector2i(11,6))
		1:
			set_cell(0, Vector2i(x,y), 0, Vector2i(6,7))
		2:
			set_cell(1, Vector2i(x,y), 1, Vector2i(1,3))
		3:
			set_cell(1, Vector2i(x,y), 1, Vector2i(0,4))
			

