/// @description Insert description here
// You can write your code in this editor

var _data_type = async_load[? "type"];

switch (_data_type) {
	case network_type_connect:
		var _player_socket = async_load[? "socket"];
		ds_list_add(player_socket_list, _player_socket);
		for (var _i = 0; _i < max_players; _i++) {
			if (!array_contains(player_ids, _i)) {
				var _new_id = _i;
				break;
			}
		}
		ds_map_add(player_ids_to_ping, _new_id, 0);
		
		array_push(player_ids, _new_id);
		
		show_debug_message("Connected player " + string(_new_id));
		
		ds_map_add(player_list, _player_socket, _new_id);
		
		
		text = "Player connected";
		text_timer = text_timer_max;
		
		
		send_packet(_player_socket, [
		[buffer_u8, networking.connection],
		[buffer_u8, _new_id],
		]);
		
		for (var _player = 0; _player < array_length(player_infos); _player++) {
			send_packet(_player_socket, [
			[buffer_u8, networking.create_player],
			[buffer_u8, player_infos[_player].this_id]
			]);
		}
		
		
		send_packet_to_all([
		[buffer_u8, networking.create_player],
		[buffer_u8, _new_id]
		]);
		
		array_push(player_infos, {this_id: _new_id, x_pos: 0, y_pos: 0, angle: 0});
		
	break;
	case network_type_disconnect:
	
		var _player_socket = async_load[? "socket"];
		disconnect_player(_player_socket);
	break;
	case network_type_data:
		handle_data();
	break;
}