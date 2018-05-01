///return a random arena
var rando = irandom(3);

if (rando == 0) {
	return rmBowl;
}

if (rando == 1) {
	return rmPillar;
}

if (rando == 2) {
	return rmHill;
}

if (rando == 3) {
	return rmFlat;
}