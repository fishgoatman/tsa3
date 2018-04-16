///@desc send player data
buffer_seek(bufferToSend, buffer_seek_start, 0);
buffer_write(bufferToSend, buffer_string, "basicState");
buffer_write(bufferToSend, buffer_u32, playerDataId.xPos);
buffer_write(bufferToSend, buffer_u32, playerDataId.yPos);
network_send_udp(udp, clientIp, portNum, bufferToSend, buffer_tell(bufferToSend));