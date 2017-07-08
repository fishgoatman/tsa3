/// @description countdown to arrows
timeLeftForArrows--;

//arrows
if (timeLeftForArrows % 30 == 0) {
	buffer_seek(bufferToSend, buffer_seek_start, 0);
	buffer_write(bufferToSend, buffer_string, "o"); //one player
	buffer_write(bufferToSend, buffer_string, "a"); //arrows
	buffer_write(bufferToSend, buffer_u16, timeLeftForArrows);
	network_send_udp(clientSocket, IP_NUM, PORT_NUM, bufferToSend, buffer_tell(bufferToSend));

	if (timeLeftForArrows == 0) {
		if (direct % 4 == 0) { //right
		    for (var i = 0; i < room_height; i += gap) {
		        instance_create(room_width - wallWidth, i, objArrowRight);
		    }
		} else if (direct % 4 == 1) { //up
		    for (var i = 0; i < room_width; i += gap) {
		        instance_create(i, wallWidth, objArrowUp);
		    }
		} else if (direct % 4 == 2) { //left
		    for (var i = 0; i < room_height; i += gap) {
		        instance_create(wallWidth, i, objArrowLeft);
		    }
		} else if (direct % 4 == 3) { //down
		    for (var i = 0; i < room_width; i += gap) {
		        instance_create(i, room_height - floorHeight, objArrowDown);
		    }
		}

		direct++;
		timeLeftForArrows = delay;
		warningCreated = false;
	}
}

//warning
if (timeLeftForArrows <= warningTime && !warningCreated) {
	if (direct % 4 == 0) { //right
	    instance_create(room_width - wallWidth - warningOffset, room_height / 2, objWarning);
	} else if (direct % 4 == 1) { //up
	    instance_create(room_width / 2, wallWidth + warningOffset, objWarning);
	} else if (direct % 4 == 2) { //left
	    instance_create(wallWidth + warningOffset, room_height / 2, objWarning);
	} else if (direct % 4 == 3) { //down
	    instance_create(room_width / 2, room_height - floorHeight - warningOffset, objWarning);
	}
	
	warningCreated = true;
}