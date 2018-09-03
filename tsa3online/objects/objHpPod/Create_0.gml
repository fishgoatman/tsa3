/// @description creation stuff
thisNumber = depth
depth = 2
image_speed = 0
heroString = selectedHero[thisNumber]

if (heroString == "mage") {
	sprite_index = sprMageHpPod
} else if (heroString == "caster") {
	sprite_index = sprCasterHpPod
} else if (heroString == "rogue") {
	sprite_index = sprRogueHpPod
} else if (heroString == "monk") {
	sprite_index = sprMonkHpPod
}