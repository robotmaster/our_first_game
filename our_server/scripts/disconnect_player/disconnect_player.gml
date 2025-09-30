// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function disconnect_player(_player_socket) {
		
		
	if (ds_map_exists(player_list, _player_socket)) {
			
			
		var _index = ds_list_find_index(player_socket_list, _player_socket);
			
			
		ds_list_delete(player_socket_list, _index);
		var _id = ds_map_find_value(player_list, _player_socket);
		
		show_debug_message("Deleted player " + string(_id));
			
			
		
		
		if (array_contains(player_ids, _id)) {
			array_delete(player_ids, array_get_index(player_ids, _id), 1);
			ds_map_delete(player_ids_to_ping, _id);
		}
			
			
		for (var _player = 0; _player < array_length(player_infos); _player++) {
			if (player_infos[_player].this_id == _id) {
				array_delete(player_infos, _player, 1);
			}
		}
			
			
		send_packet_to_all([
		[buffer_u8, networking.delete_player],
		[buffer_u8, _id],
		]);
			
		ds_map_delete(player_list, _player_socket);
	}
	network_destroy(_player_socket);
		
		
	text = "Player disconnected";
	text_timer = text_timer_max;
}