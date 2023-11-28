extends TileMap

# ตั้งค่า TileSet ให้กับ TileMap
var tileset : TileSet

func _ready():
	# ให้ TileMap ใช้ TileSet
	set_tileset(tileset)

	# กำหนดแผนที่โดยใช้ตำแหน่งของแต่ละช่องในภาพแผนที่
	for y in range(get_used_rect().size.y):
		for x in range(get_used_rect().size.x):
			var tile_type := get_cell(x, y)
			set_cell(x, y, tile_type)
