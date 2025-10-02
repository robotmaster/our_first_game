var _delta = delta_time / 1000000 * 60;
if (!connected) {
	ping_timer = 0;
	connection_timer -= _delta;
	if (connection_timer <= 0) {
		connection_timer += connection_timer_max;
		if (client_socket > -1) {
			network_destroy(client_socket);
		}
		show_debug_message("Tried connecting");
		client_socket = network_create_socket(network_socket_ws);
		//network_connect_async(client_socket, "127.0.0.1", 5359);
		network_connect_async(client_socket, "71.202.88.160", 5359);
	}
	exit;
}

connection_timer = 180;
ping_timer += global.delta;
if (ping_timer >= ping_timer_max && !force_connected_debug) {
	reset_game();
	exit;
}
