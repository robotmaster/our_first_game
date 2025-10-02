// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

player_position = [0,0];

function simulate_enemies() {
	enemy_spawn_timer = timer(enemy_spawn_timer, 1);
	if (enemy_spawn_timer <= 0) {
		enemy_spawn_timer += enemy_spawn_timer_max;
		var _dist = 3000;
		for (var _player_index = 0; _player_index < array_length(player_infos); _player_index++) {
			summon_enemy(player_infos[_player_index].x_pos, player_infos[_player_index].y_pos);
		}
	}
	
	for (var _enemy_index = 0; _enemy_index < array_length(enemy_infos); _enemy_index++) {
		var _enemy = enemy_infos[_enemy_index];
		
		var _enemy_speed = 20;
		var _dist_to_stop = 150; 		
		var _lowest_dist = infinity;
		var _lowest_direction = -1;
		for (var _player_index = 0; _player_index < array_length(player_infos); _player_index++) {
			var _dist = point_distance(player_infos[_player_index].x_pos, player_infos[_player_index].y_pos, _enemy.x_pos, _enemy.y_pos);
			if (_dist < _lowest_dist) {
				_lowest_dist = _dist;
				_lowest_direction = point_direction(player_infos[_player_index].x_pos, player_infos[_player_index].y_pos, _enemy.x_pos, _enemy.y_pos);
				player_position = [player_infos[_player_index].x_pos, player_infos[_player_index].y_pos];
			}
		}
		_enemy.rot = point_direction(_enemy.x_pos, _enemy.y_pos, player_position[0], player_position[1]);
		if (sqrt(sqr(_enemy.x_pos-player_position[0])+sqr(_enemy.y_pos-player_position[1])) < _dist_to_stop) continue; 
	
		_enemy.x_pos -= lengthdir_x(_enemy_speed, _lowest_direction);
		_enemy.y_pos -= lengthdir_y(_enemy_speed, _lowest_direction);

	}
}