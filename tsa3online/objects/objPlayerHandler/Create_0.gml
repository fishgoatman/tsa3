///@desc creation stuff
//hero
thisNumber = depth;
depth = 0;
heroString = selectedHero[thisNumber];

if (heroString == "standardMage") {
	heroObj = objStandardMageTP;
} else if (heroString == "assassinMage") {
	heroObj = objAssassinMageTP;
} else if (heroString == "caster") {
	heroObj = objCasterTP;
}

mask_index = object_get_mask(heroObj);
var createX;
var createY;

do {
	if (thisNumber == 0) {
		createX = random(room_width / 3);
	} else if (thisNumber == 1) {
		createX = random(room_width / 3) + room_width * 2 / 3;
	}
	
	createY = random(room_height);
} until (!place_meeting(createX, createY, objBlock));

var createdId = instance_create_depth(createX, createY, thisNumber, heroObj);
heroId[thisNumber] = createdId;
myHeroId = heroId[thisNumber];

//hp bar
var hpPerGap = hpPerLine * hpBarWidth / myHeroId.maxHp;
var lastGap = 0;

for (var i = 0; i < hpBarWidth; i++) {
    if (i - lastGap < hpPerGap) {
		var createX;
		
		if (thisNumber == 0) {
			createX = hpBarOffset + i;
		} else if (thisNumber == 1) {
			createX = room_width - hpBarOffset - hpBarWidth + i;
		}
		
		hpBar[thisNumber, i] = instance_create(createX, hpBarOffset, objHpPod);
	} else {
		hpBar[thisNumber, i] = -1;
		lastGap = i;
	}
}

lastPodLost = array_length_2d(hpBar, thisNumber);

//cooldowns
cooldownNum = 4;
cooldownFrames = 30;
var cooldownWidth = 32;
var cooldownGap = (hpBarWidth - cooldownWidth * cooldownNum) / (cooldownNum - 1);
var cooldownObj;

if (heroString == "standardMage" || heroString == "assassinMage") {
	cooldownObj = objMageCooldown;
} else if (heroString == "caster") {
	cooldownObj = objCasterCooldown;
}

for (var i = 0; i < cooldownNum; i++) {
	var createX = hpBarOffset + (i + 0.5) * cooldownWidth + i * cooldownGap;
	
	if (thisNumber == 1) {
		createX = room_width - hpBarWidth - 2 * hpBarOffset + createX;
	}
	
	var createY = hpBarOffset + hpBarHeight + cooldownOffset;
	var cd = instance_create(createX, createY, cooldownObj);
	cd.image_speed = 0;
	cooldownBar[thisNumber, i] = cd;
}