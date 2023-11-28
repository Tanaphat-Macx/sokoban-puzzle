extends Node2D

var level_data := [
	[1, 1, 1, 1, 1],
	[1, 0, 0, 2, 1],
	[1, 2, 3, 2, 1],
	[1, 1, 1, 1, 1],
]

# ให้แทนเลขด้วยตัวอักษรหรือชื่อของทรัพยากรที่ใช้แสดงในเกม
var TILE_SIZE := 64
var WALL := 1
var PLAYER := 2
var BOX := 3
var TARGET := 4

func _ready():
	create_level()

func create_level():
	for y in range(level_data.size()):
		for x in range(level_data[y].size()):
			var tile_type = level_data[y][x]
			create_tile(tile_type, x, y)

func create_tile(tile_type, x, y):
	var tile = TileMap.new()
#	var tile2 = Tile
	tile.tile_type = tile_type
	tile.position = Vector2(x * TILE_SIZE, y * TILE_SIZE)
	add_child(tile)
