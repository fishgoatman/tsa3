///@desc layout and bk
var borderWidth = 5
instance_create(-borderWidth, -borderWidth, objSideBorder)
instance_create(room_width, -borderWidth, objSideBorder)
instance_create(-borderWidth, -borderWidth, objTopBorder)
instance_create(-borderWidth, room_height, objTopBorder)

with (objBlock) {
	instance_create(room_width - x, y, object_index)
}

with (objPlatform) {
	instance_create(room_width - x, y, object_index)
}

if (room == rmForest) {
	bkObj = objForestBk
} else if (room == rmMountain) {
	bkObj = objMountainBk
} else if (room == rmTundra) {
	bkObj = objTundraBk
} else if (room == rmDesert) {
	bkObj = objDesertBk
}

var size = 50

for (var yy = 0; yy < room_width; yy += size) {
	for (var xx = 0; xx < room_width; xx += size) {
		instance_create_depth(xx, yy, 5, bkObj)
	}
}