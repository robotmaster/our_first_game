randomize();
enum networking {
	connection,
	create_player,
	delete_player,
	ticks,
	pause,
	lose
	//miss,
	///subtract_health,
	//set_health,
	//kill
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


game_speed = 60;
game_set_speed(game_speed, gamespeed_fps);
physics_world_update_speed(game_speed);



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

enemy_spawn_multiplier = 0.99994;

ping_timer_max = 120;

player_ids = [];

enemy_speed_increase_multiplier = 1;


reset_game();