// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function tick() {
	//only use with obj_player
	tick_start_x = actual_x;
	tick_start_y = actual_y;
	handle_player_movement();
		
	var _packet_info = [
	[buffer_u8, networking.ticks],
	[buffer_u8, obj_client.id_player],
	[buffer_s32, actual_x],
	[buffer_s32, actual_y],
	[buffer_u16, player_angle],
	[buffer_bool, false],
	];
	if (handle_shooting()) {
		_packet_info[5][1] = true;
	}
	
	
	handle_damage();

	
	send_packet(obj_client.client_socket, _packet_info);
	
}