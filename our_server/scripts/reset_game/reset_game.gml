// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function reset_game() {
	player_infos = [];
	bullet_infos = [];
	enemy_infos = [];
	events = [];
	paused = false;
	enemy_spawn_timer = 0;
	enemy_spawn_timer_max = 240;
	
	survived = 0;


	players_to_id = ds_map_create();

	bullets_to_id = ds_map_create();

	enemies_to_id = ds_map_create();
}