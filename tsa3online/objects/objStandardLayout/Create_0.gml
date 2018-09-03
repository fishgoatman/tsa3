///@desc layout and bk
instance_create(room_width / 2, room_height / 2, objBorder)

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