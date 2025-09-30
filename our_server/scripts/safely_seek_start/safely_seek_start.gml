// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function safely_seek_start(_packet) {
	try {
		buffer_seek(_packet, buffer_seek_start, 0);
	}
	catch (_excpetion) {
		show_debug_message("Invalid packet.");
	}
}