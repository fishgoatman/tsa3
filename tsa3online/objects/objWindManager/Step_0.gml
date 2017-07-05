/// @description create wind
for (var i = 0; i < random(abs(windSpd) / 1.5); i++) {
    instance_create(random(room_width), random(room_height), objWind);
}

windSpd = windSpdMax * sin(counter / 200);
counter++;

