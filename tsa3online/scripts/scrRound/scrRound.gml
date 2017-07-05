/// @description scrRound
if (argument0 % 1 >= 0.5) {
    return floor(argument0) + 1;
} else {
    return floor(argument0);
}
