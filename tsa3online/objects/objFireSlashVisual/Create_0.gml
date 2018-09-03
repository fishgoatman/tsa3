///@desc creation stuff
thisNumber = depth;
depth = 0;
myHeroId = heroId[thisNumber];
time = myHeroId.slashHitboxDuration;
currTime = 0;
image_xscale = myHeroId.image_xscale;
audio_play_sound(sndFireSlash, 1, false);