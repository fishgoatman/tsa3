///return a random arena
var rando = irandom(3);

if (rando == 0) {
	return rmForest;
}

if (rando == 1) {
	return rmMountain;
}

if (rando == 2) {
	return rmTundra;
}

if (rando == 3) {
	return rmDesert;
}