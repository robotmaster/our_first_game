var _delta = delta_time / 1000000 * 60;
if (_delta > 20) {
	_delta = 20;
}
if (game_server < 0) {
	text = "Server NOT created.";
	text_timer = text_timer_max;
	if (server_creation_timer <= 0) {	
		server_creation_timer += server_creation_timer_max;
		game_server = network_create_server(network_socket_ws, 5359, max_players);
		text = "Server created.";
		text_timer = text_timer_max;
	}
	server_creation_timer -= _delta;
	exit;
}
survived += _delta;


global.tick_timer += _delta;

while (global.tick_timer > global.tick_timer_max) {
	global.tick_timer -= global.tick_timer_max;
	simulate_enemies();
	tick();
}




for (var _i = 0; _i < array_length(player_infos); _i++) {
	player_infos[_i].ping_timer += _delta;
	if (player_infos[_i].ping_timer < ping_timer_max) {
		continue;
	}
			
	for (var _i = 0; _i < ds_list_size(player_socket_list); _i++) {
		var _socket = ds_list_find_value(player_socket_list, _i);
		if (ds_map_find_value(player_list, _socket) == player_infos[_i].this_id) {
			disconnect_player(_socket);
			handle_loss();
			break;
		}
	}
	
}
if (array_length(bullet_infos) != ds_map_size(bullets_to_id)) {
	show_debug_message("Broken bullets")
}
if (array_length(enemy_infos) != ds_map_size(enemies_to_id)) {
	show_debug_message("Broken enemies")
}