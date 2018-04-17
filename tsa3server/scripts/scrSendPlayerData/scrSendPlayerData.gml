///@desc send player data
//basic state
buffer_seek(bufferToSend, buffer_seek_start, 0);
buffer_write(bufferToSend, buffer_string, "basicState");
buffer_write(bufferToSend, buffer_u8, p);
buffer_write(bufferToSend, buffer_u32, playerDataId.xPos);
buffer_write(bufferToSend, buffer_u32, playerDataId.yPos);
network_send_udp(udp, clientIp, udpPortNum, bufferToSend, buffer_tell(bufferToSend));