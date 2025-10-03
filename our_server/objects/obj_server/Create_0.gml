randomize();
enum networking {
	connection,
	create_player,
	delete_player,
	ticks,
	//miss,
	///subtract_health,
	//set_health,
	//kill
}

global.tick_timer_max = 1;
global.tick_timer = 0;

text = "";
text_timer = 0;
text_timer_max = 180;
max_players = 10;

server_creation_timer = 0;
server_creation_timer_max = 120;
game_server = -1;

player_socket_list = ds_list_create();
player_list = ds_map_create();


player_ids_to_ping = ds_map_create();

enemy_spawn_timer = 0;
enemy_spawn_timer_max = 240;
enemy_spawn_multiplier = 0.99;

ping_timer_max = 120;

player_ids = [];


player_infos = [];
bullet_infos = [];
enemy_infos = [];


players_to_id = ds_map_create();

bullets_to_id = ds_map_create();

enemies_to_id = ds_map_create();