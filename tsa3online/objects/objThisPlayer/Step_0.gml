/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 4669D4DA
/// @DnDArgument : "code" "/// @description get input$(13_10)if (instance_exists(heroId) && !heroId.isSelectHero) {$(13_10)    attackKey = mouse_check_button(mb_left);$(13_10)    abilityKey = mouse_check_button(mb_right);$(13_10)} else {$(13_10)    attackKey = mouse_check_button_pressed(mb_left);$(13_10)    abilityKey = mouse_check_button_pressed(mb_right);$(13_10)}$(13_10)$(13_10)if (instance_exists(heroId)) {$(13_10)    scrGetInput();$(13_10)} else {$(13_10)    instance_destroy();$(13_10)}$(13_10)$(13_10)mask_index = object_get_sprite(hero);"
/// @description get input
if (instance_exists(heroId) && !heroId.isSelectHero) {
    attackKey = mouse_check_button(mb_left);
    abilityKey = mouse_check_button(mb_right);
} else {
    attackKey = mouse_check_button_pressed(mb_left);
    abilityKey = mouse_check_button_pressed(mb_right);
}

if (instance_exists(heroId)) {
    scrGetInput();
} else {
    instance_destroy();
}

mask_index = object_get_sprite(hero);

/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 0314E518
/// @DnDArgument : "code" "/// @description send data to server$(13_10)var bufferToSend = buffer_create(64, buffer_fixed, 1);$(13_10)buffer_seek(bufferToSend, buffer_seek_start, 0);$(13_10)buffer_write(bufferToSend, buffer_string, "p"); //stands for player data$(13_10)buffer_write(bufferToSend, buffer_u16, 0); //divider$(13_10)buffer_write(bufferToSend, buffer_string, "x"); //x position$(13_10)buffer_write(bufferToSend, buffer_u16, tpId.x);$(13_10)buffer_write(bufferToSend, buffer_string, "y"); //y position$(13_10)buffer_write(bufferToSend, buffer_u16, tpId.y);$(13_10)network_send_udp(clientSocket, IP_NUM, PORT_NUM, bufferToSend, buffer_tell(bufferToSend));$(13_10)buffer_delete(bufferToSend);"
/// @description send data to server
var bufferToSend = buffer_create(64, buffer_fixed, 1);
buffer_seek(bufferToSend, buffer_seek_start, 0);
buffer_write(bufferToSend, buffer_string, "p"); //stands for player data
buffer_write(bufferToSend, buffer_u16, 0); //divider
buffer_write(bufferToSend, buffer_string, "x"); //x position
buffer_write(bufferToSend, buffer_u16, tpId.x);
buffer_write(bufferToSend, buffer_string, "y"); //y position
buffer_write(bufferToSend, buffer_u16, tpId.y);
network_send_udp(clientSocket, IP_NUM, PORT_NUM, bufferToSend, buffer_tell(bufferToSend));
buffer_delete(bufferToSend);