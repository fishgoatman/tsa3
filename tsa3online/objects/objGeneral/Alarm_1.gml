/// @description reset
gg = NONE;
room_goto(rmCharacterSelect);

if (mode == "online") {
	thisPlayerHero = objSelectHeroTP;
} else if (mode == "offline") {
	mousePlayerHero = objSelectHeroTP;
	keyboardPlayerHero = objSelectHeroTP;
}