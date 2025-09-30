// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function send_packet(_socket, _data) {
	var _buffer = buffer_create(1, buffer_grow, 1);
	for (var _piece_of_data = 0; _piece_of_data < array_length(_data); _piece_of_data++) {
		buffer_write(_buffer, _data[_piece_of_data][0], _data[_piece_of_data][1]);
	}
	network_send_packet(_socket, _buffer, buffer_tell(_buffer));
	buffer_delete(_buffer);
}