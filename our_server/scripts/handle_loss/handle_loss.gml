// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function handle_loss() {
	for (var _player_index = 0; _player_index < array_length(player_infos); _player_index++) {
		if (!player_infos[_player_index].ghost) {
			return;
		}
	}
	
	show_debug_message("Lost, survied for " + string(survived / 60));
	send_packet_to_all([
	[buffer_u8, networking.lose]
	]);
	while (ds_list_size(player_socket_list) > 0) {
		disconnect_player(ds_list_find_value(player_socket_list, 0));
	}
	reset_game();
}