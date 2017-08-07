/// @desc
if (step % frequency == 0) {
	var distTravelled = 0;
	var startX = x;
	var startY = y;
	var currSign = scrRandSign();
	
	do {
		var extraAngle = random_range(minAngle, maxAngle) * currSign;
		var length = random_range(minLength, maxLength);
		distTravelled += length;
		var lEndX;
		var lEndY
		
		if (distTravelled >= dist) {
			lEndX = endX;
			lEndY = endY;
		} else {
			lEndX = x + dcos(baseAngle) * distTravelled + dcos(baseAngle + extraAngle) * length;
			lEndY = y - dsin(baseAngle) * distTravelled - dsin(baseAngle + extraAngle) * length;
		}
		
		var xDiff = lEndX - startX;
		var yDiff = startY - lEndY;
		var hyp = sqrt(xDiff * xDiff + yDiff * yDiff);
		var actualAngle = darctan2(yDiff, xDiff);
		
		for (var i = 0; i < hyp; i++) {
			instance_create(startX + i * dcos(actualAngle), startY - i * dsin(actualAngle), objWhitePixel);
		}
		
		startX = lEndX;
		startY = lEndY;
		currSign *= -1;
	} until (distTravelled >= dist);
}

step++;

if (!heroId.logicId.lightningOn) {
	instance_destroy();
}