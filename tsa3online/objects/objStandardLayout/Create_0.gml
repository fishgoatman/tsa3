///@desc layout and bk
var borderWidth = 50

with (objSideBorder) {
	instance_destroy()
}

instance_create_depth(-borderWidth, -borderWidth, 0, objSideBorder)
instance_create_depth(room_width, -borderWidth, 0, objSideBorder)
instance_create_depth(-borderWidth, -borderWidth, 0, objTopBorder)
instance_create_depth(-borderWidth, room_height, 0, objTopBorder)

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
} else if (room == rmBlack) {
	bkObj = noone
}

var size = 50

for (var yy = 0; yy < room_width; yy += size) {
	for (var xx = 0; xx < room_width; xx += size) {
		if (bkObj != noone) {
			instance_create_depth(xx, yy, 5, bkObj)
		}
	}
}