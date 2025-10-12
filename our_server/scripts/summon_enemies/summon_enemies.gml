// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function summon_enemies() {
	if (ds_list_size(player_socket_list) > 0 && !paused) {
		enemy_spawn_timer_max *= enemy_spawn_multiplier;
		enemy_spawn_timer -= 1;
		while (enemy_spawn_timer <= 0) {
			enemy_spawn_timer += enemy_spawn_timer_max;
			var _dist = 3000;
			for (var _player_index = 0; _player_index < array_length(player_infos); _player_index++) {
				var _dir = random(360);
				var _offset_x = lengthdir_x(_dist, _dir);
				var _offset_y = lengthdir_y(_dist, _dir);
				if ((enemy_spawn_timer_max <= 210) && (irandom_range(1, 6) == 1)) {
					summon_enemy(player_infos[_player_index].x_pos + _offset_x, player_infos[_player_index].y_pos + _offset_y, obj_enemy_tank, -1);
				}
				else {
					summon_enemy(player_infos[_player_index].x_pos + _offset_x, player_infos[_player_index].y_pos + _offset_y, obj_enemy_basic, -1);
				}
			}
		}
	}
}