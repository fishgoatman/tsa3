/// @description scrMove !!CHANGE TO DOING DX AND DY FIRST THEN DOING THEM SEPARATELY!!
var tryX = preciseX
var tryY = preciseY
var yDisp = 0
var xDisp = 0
var hyp = sqrt(dx * dx + dy * dy)
var tempDx = dx / hyp
var tempDy = dy / hyp
var collideObj

if (dy <= 0) {
	collideObj = objBlockAndPlatform
} else {
	collideObj = objBlock
}

while (abs(yDisp) < abs(dy) && abs(xDisp) < abs(dx) && !place_meeting(tryX + tempDx, tryY - tempDy, collideObj)) {
	if (abs(yDisp - dy) >= tempDy) {
		tryY -= tempDy
		yDisp -= tempDy
	} else {
		tryY = preciseY - dy
		yDisp = dy
	}
	
	if (abs(xDisp - dx) >= tempDx) {
		tryX += tempDx
		xDisp += tempDx
	} else {
		tryX = preciseX + dx
		xDisp = dx
	}
}

while (abs(yDisp) < abs(dy) && !place_meeting(tryX, tryY - tempDy, collideObj)) {
    if (abs(yDisp - dy) >= tempDy) {
		tryY -= tempDy
		yDisp -= tempDy
	} else {
		tryY = preciseY - dy
		yDisp = dy
	}
}

while (abs(xDisp) < abs(dx) && !place_meeting(tryX + tempDx, tryY, collideObj)) {
    if (abs(xDisp - dx) >= tempDx) {
		tryX += tempDx
		xDisp += tempDx
	} else {
		tryX = preciseX + dx
		xDisp = dx
	}
}

preciseX = tryX
preciseY = tryY
x = scrRound(preciseX)
y = scrRound(preciseY)