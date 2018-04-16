///@desc networking stuff
var receivedBuffer = async_load[? "buffer"];
var ip = async_load[? "ip"];
var bufferType = buffer_read(receivedBuffer, buffer_string);

if (bufferType == "basicState") {
	var playerNum = buffer_read(receivedBuffer, buffer_u32);
	var xPos = buffer_read(receivedBuffer, buffer_u32);
	var yPos = buffer_read(receivedBuffer, buffer_u32);
	var playerDataId = ds_map_find_value(playerDataIds, playerNum);
	playerDataId.xPos = xPos;
	playerDataId.yPos = yPos;
}