///creates symmetrically
var xPos = argument0;
var yPos = argument1;
var obj = argument2;
instance_create(xPos, yPos, obj);
instance_create(room_width - xPos, yPos, obj);