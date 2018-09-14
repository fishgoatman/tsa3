///@desc creation stuff
//position: 0 fight; 1 one player; 2 options; 3 help
//number: 0 red; 1 blue; 2 green; 3 purple
remainingColors = ds_list_create()

for (var i = 0; i < 4; i++) {
	ds_list_add(remainingColors, i)
}

for (var i = 0; i < 4; i++) {
	var size = ds_list_size(remainingColors)
	var rando = irandom(size - 1)
	colors[i] = ds_list_find_value(remainingColors, rando)
	ds_list_delete(remainingColors, rando)
}

for (var i = 0; i < 4; i++) {
	show_debug_message(string(i) + " " + string(colors[i]))
}

///left half
for (var yy = 0; yy < room_height; yy += 50) {
	for (var xx = 0; xx < room_width / 2; xx += 50) {
		var color = colors[0]
		var createObj
		
		if (color == 0) {
			createObj = objDesertBk
		} else if (color == 1) {
			createObj = objTundraBk
		} else if (color == 2) {
			createObj = objMountainBk
		} else if (color == 3) {
			createObj = objForestBk
		}
		
		instance_create_depth(xx, yy, 0, createObj)
	}
}

///right half
var height = floor(room_height / 3)

for (var i = 0; i < 3; i++) {
	for (var yy = height * i; yy < height * (i + 1); yy += 50) {
		for (var xx = room_width / 2; xx < room_width; xx += 50) {
			var color = colors[i + 1]
			var createObj
		
			if (color == 0) {
				createObj = objDesertBk
			} else if (color == 1) {
				createObj = objTundraBk
			} else if (color == 2) {
				createObj = objMountainBk
			} else if (color == 3) {
				createObj = objForestBk
			}
		
			instance_create_depth(xx, yy, -(i + 1), createObj)
		}
	}
}