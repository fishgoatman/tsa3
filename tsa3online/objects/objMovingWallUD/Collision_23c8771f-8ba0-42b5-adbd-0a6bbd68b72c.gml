/// @description move the player
other.preciseX += dx + sign(dx);
other.preciseY -= dy + sign(dy);
other.x = other.preciseX;
other.y = other.preciseY;

