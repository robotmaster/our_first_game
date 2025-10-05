// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function handle_loss() {
	var _lost = true;
	for (var _player_index = 0; _player_index < array_length(player_infos); _player_index++) {
		if (!player_infos[_player_index].ghost) {
			_lost = false;
			break;
		}
	}
	
	if (_lost) {
		show_debug_message("Lost, survied for " + string(survived / 60));
		for (var _player_index = 0; _player_index < ds_list_size(player_socket_list); _player_index++) {
			disconnect_player(ds_list_find_value(player_socket_list, _player_index));
		}
		
		bullet_infos = [];
		enemy_infos = [];
		enemy_spawn_timer = 0;
		enemy_spawn_timer_max = 150;


		players_to_id = ds_map_create();

		bullets_to_id = ds_map_create();

		enemies_to_id = ds_map_create();
	}
}