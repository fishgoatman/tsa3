///@desc creation stuff
//hero
if (depth < 0) {
	ai = true
	depth += 2
} else {
	ai = false
}

thisNumber = depth;
depth = 0;
heroString = selectedHero[thisNumber];

while (heroString == "random") {
	var randRow = irandom(array_height_2d(characterSelect) - 1);
	var randCol = irandom(array_length_2d(characterSelect, randRow) - 1);
	heroString = characterSelect[randRow, randCol];
}

if (heroString == "mage") {
	heroObj = objMageTP;
} else if (heroString == "caster") {
	heroObj = objCasterTP;
} else if (heroString == "rogue") {
	heroObj = objRogueTP;
} else if (heroString == "monk") {
	heroObj = objMonkTP;
} else if (heroString = "monkMage") {
	heroObj = objMonkMage
} else if (heroString == "warlord") {
	heroObj = objWarlordTP;
}

mask_index = object_get_mask(heroObj);
var createX;
var createY;
var margin = 20;

do {
	createX = random_range(margin, room_width / 2 - margin)
	createY = random_range(margin, room_height - margin)
} until (!place_meeting(createX, createY, objBlock))

var createDepth

if (ai) {
	createDepth = thisNumber - 2
} else {
	createDepth = thisNumber
}

var createdId = instance_create_depth(createX, createY, createDepth, heroObj)
heroId[thisNumber] = createdId
myHeroId = heroId[thisNumber]

//cooldowns
cooldownNum = 4;
cooldownFrames = 30;
var cooldownWidth = 32;
var cooldownGap = (hpBarWidth - cooldownWidth * cooldownNum) / (cooldownNum - 1);
var cooldownObj;

if (heroString == "mage") {
	cooldownObj = objMageCooldown;
} else if (heroString == "caster") {
	cooldownObj = objCasterCooldown;
} else if (heroString == "rogue") {
	cooldownObj = objRogueCooldown;
} else if (heroString == "monk") {
	cooldownObj = objMonkCooldown;
} else if (heroString == "monkMage") {
	cooldownObj = objShamanCooldown
} else if (heroString == "warlord") {
	cooldownObj = objWarlordCooldown;
}

for (var i = 0; i < cooldownNum; i++) {
	var createX = hpBarOffset + (i + 0.5) * cooldownWidth + i * cooldownGap;
	
	if (thisNumber == 1) {
		createX = room_width - hpBarWidth - 2 * hpBarOffset + createX;
	}
	
	var createY = hpBarOffset + hpBarHeight + cooldownOffset;
	var cd = instance_create(createX, createY, cooldownObj);
	cd.image_speed = 0;
	cooldownBar[thisNumber, i] = cd
}