/// @description move
scrMove();

if (place_meeting(preciseX + sign(dx), preciseY - sign(dy), objBlock)) {
    sprite_index = sprArrowLodged;
    mask_index = sprNone;
    dx = 0;
    dy = 0;
}

if (sprite_index == sprArrowLodged && image_index >= image_number - 1) {
    image_speed = 0;
}

