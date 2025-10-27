enum networking {
	connection,
	create_player,
	delete_player,
	ticks,
	pause,
	lose
	//miss,
	//subtract_health,
	//set_health,
	//kill,
}
enum enemies {
	death,
	rock,
	basic,
	tank,
}
enum event {
	hit
}
randomize();
room_goto(rm_game);
client_socket = -1;
force_connected_debug = false;

paused = false;


show_stats = -1;


connected = force_connected_debug;
connection_timer = 0;
connection_timer_max = 180;



ping_timer = 0;
ping_timer_max = 120;


id_player = -1;
players_to_id = ds_map_create();

bullets_to_id = ds_map_create();

enemies_to_id = ds_map_create();