var _delta = delta_time / 1000000 * 60;
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
}
/*
for (var _i = 0; _i < array_length(player_ids); _i++) {
	var _id = player_ids[_i];
	if (ds_map_exists(player_ids_to_ping, _id)) {
		var _elapsed_time = ds_map_find_value(player_ids_to_ping, _id);
		if (_elapsed_time >= ping_timer_max) {
			
			for (var _i = 0; _i < ds_list_size(player_socket_list); _i++) {
				var _socket = ds_list_find_value(player_socket_list, _i);
				if (ds_map_find_value(player_list, _socket) == _id) {
					disconnect_player(_socket);
					break;
				}
			}
			
			
			
			break;
		}
		ds_map_replace(player_ids_to_ping, _id, _elapsed_time + global.delta);
	}
	else {
		show_debug_message("Mismatch between player_ids_to_ping and player_ids, id: " + string(_id));
	}
}
	
for (var _i = 0; _i < array_length(player_healths); _i++) {
	var _health = player_healths[_i].this_health;
	_health += global.health_regen_rate * global.delta;
	if (_health > global.max_health) {
		_health = global.max_health;
	}
	player_healths[_i].this_health = _health;
}*/