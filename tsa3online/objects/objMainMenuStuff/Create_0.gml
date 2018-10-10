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

objGeneralNew.selectHighlightId = instance_create_depth(0, 0, 0, objSelectHighlight)

///left half
var hero
var color = colors[0]
var createObj
		
if (color == 0) {
	createObj = objDesertBk
	hero = "mage"
} else if (color == 1) {
	createObj = objTundraBk
	hero = "caster"
} else if (color == 2) {
	createObj = objMountainBk
	hero = "rogue"
} else if (color == 3) {
	createObj = objForestBk
	hero = "monk"
}

for (var yy = 0; yy < room_height; yy += 50) {
	for (var xx = 0; xx < room_width / 2; xx += 50) {
		instance_create_depth(xx, yy, 0, createObj)
	}
}

var borderWidth = 50
instance_create_depth(-borderWidth, -borderWidth, 1, objSideBorder)
instance_create_depth(-borderWidth, -borderWidth, 1, objTopBorder)
instance_create_depth(room_width / 2, -borderWidth, 1, objSideBorder)
instance_create_depth(-borderWidth, room_height, 1, objTopBorder)
selectedHero[0] = hero
selectedHero[1] = hero
numberWithSprite2 = irandom(1)
playerHandlerObj[0] = instance_create_depth(0, 0, -1, objPlayerHandler)
playerHandlerObj[1] = instance_create_depth(0, 0, -2, objPlayerHandler)

///right half
var height = floor(room_height / 3)

for (var i = 0; i < 3; i++) {
	var color = colors[i + 1]
	var createObj
	
	if (color == 0) {
		createObj = objDesertButton
	} else if (color == 1) {
		createObj = objTundraButton
	} else if (color == 2) {
		createObj = objMountainButton
	} else if (color == 3) {
		createObj = objForestButton
	}
		
	instance_create_depth(room_width / 2, 167 * i, 0, createObj)
}