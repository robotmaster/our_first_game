// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function handle_data() {
	var _packet = async_load[? "buffer"];
	safely_seek_start(_packet);
	var _packet_id = read_packet(_packet, buffer_u8);
	switch (_packet_id) {
		case networking.ticks:
			var _player_id = read_packet(_packet, buffer_u8);
			var _player_x = read_packet(_packet, buffer_s32);
			var _player_y = read_packet(_packet, buffer_s32);
			var _player_angle = read_packet(_packet, buffer_u16);
			var _will_shoot = read_packet(_packet, buffer_bool);
			var _list_of_info = [
			[buffer_u8, networking.ticks],
			[buffer_u8, _player_id],
			[buffer_s32, _player_x],
			[buffer_s32, _player_y],
			[buffer_u16, _player_angle],
			[buffer_bool, _will_shoot],
			]
			ds_map_replace(player_ids_to_ping, _player_id, 0);
			
			
			for (var _player = 0; _player < array_length(player_infos); _player++) {
				if (player_infos[_player].this_id == _player_id) {
					
					
					player_infos[_player].x_pos = _player_x;
					player_infos[_player].y_pos = _player_y;
					player_infos[_player].angle = _player_angle;
					send_packet_to_all(_list_of_info)
					
					break;
				}
			}
			
		break;
		/*
		case networking.miss:
			var _player_id = read_packet(_packet, buffer_u8);
			send_packet_to_all([
			[buffer_u8, networking.miss],
			[buffer_u8, _player_id]
			]);
		
		break;*/
		/*
		case networking.subtract_health:
			var _player_attack_id = read_packet(_packet, buffer_u8);
			var _player_id = read_packet(_packet, buffer_u8);
			var _health = read_packet(_packet, buffer_u16);
			
			
			for (var _player = 0; _player < array_length(player_positions); _player++) {
				if (player_healths[_player].this_id == _player_id) {
					
					
					player_healths[_player].this_health -= _health;
					if (player_healths[_player].this_health <= 0) {
						send_packet_to_all([
						[buffer_u8, networking.kill],
						[buffer_u8, _player_attack_id],
						[buffer_u8, _player_id],
						]);
						for (var _i = 0; _i < ds_list_size(player_socket_list); _i++) {
							var _socket = ds_list_find_value(player_socket_list, _i);
							if (ds_map_find_value(player_list, _socket) == _player_id) {
								disconnect_player(_socket);
								break;
							}
						}
						break;
					}
					
					send_packet_to_all([
					[buffer_u8, networking.set_health],
					[buffer_u8, _player_attack_id],
					[buffer_u8, _player_id],
					[buffer_u16, round(player_healths[_player].this_health)],
					]);
					
					break;
				}
			}
		*/
		
		default:
			show_debug_message("Invalid packet.");
		break;
	}
}