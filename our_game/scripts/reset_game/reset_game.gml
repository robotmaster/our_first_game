// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function reset_game() {
	connected = false;
	id_player = -1;
	players_to_id = ds_map_create();
	bullet_ids = ds_list_create();
	bullets_to_id = ds_map_create();
	show_stats = -1;
	paused = false;
	room_goto(rm_game);
}