enum networking {
	connection,
	create_player,
	delete_player,
	ticks,
	//miss,
	//subtract_health,
	//set_health,
	//kill,
}
randomize();
room_goto(rm_game);
client_socket = -1;
force_connected_debug = false;


connected = force_connected_debug;
connection_timer = 0;
connection_timer_max = 180;



ping_timer = 0;
ping_timer_max = 120;


id_player = -1;
player_ids = ds_list_create();
players_to_id = ds_map_create();

bullet_ids = ds_list_create();
bullets_to_id = ds_map_create();

enemy_ids = ds_list_create();
enemies_to_id = ds_map_create();