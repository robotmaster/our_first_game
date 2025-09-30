// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function read_packet(_packet, _type) {
	try {
		return buffer_read(_packet, _type);
	}
	catch (_exception) {
		show_debug_message("Invalid packet.");
	}
}