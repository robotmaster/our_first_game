// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function simulate_enemies() {
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
	
	for (var _enemy_index = 0; _enemy_index < array_length(enemy_infos); _enemy_index++) {
		var _enemy = enemy_infos[_enemy_index];
		var _enemy_instance = ds_map_find_value(enemies_to_id, _enemy.this_id);
		if (!paused) {
			_enemy.x_pos = _enemy_instance.x;
			_enemy.y_pos = _enemy_instance.y;
			_enemy.rot = _enemy_instance.image_angle;
			switch (_enemy.type) {
				case 0:
				break;
				case 1:
					var _enemy_speed = 7;
					//var _dist_to_stop = 150; 		
					var _lowest_dist = infinity;
					var _lowest_direction = -1;
					for (var _player_index = 0; _player_index < array_length(player_infos); _player_index++) {
						if (player_infos[_player_index].ghost) {
							continue;
						}
						var _dist = point_distance(player_infos[_player_index].x_pos, player_infos[_player_index].y_pos, _enemy.x_pos, _enemy.y_pos);
						if (_dist < _lowest_dist) {
							_lowest_dist = _dist;
							_lowest_direction = point_direction(_enemy.x_pos, _enemy.y_pos, player_infos[_player_index].x_pos, player_infos[_player_index].y_pos);
				
						}
					}
					_enemy_instance.phy_rotation = -_lowest_direction;
					_enemy_instance.phy_speed_x = lengthdir_x(_enemy_speed, _lowest_direction);
					_enemy_instance.phy_speed_y = lengthdir_y(_enemy_speed, _lowest_direction);
				break;
				case 2:
					var _enemy_speed = 6;
					//var _dist_to_stop = 150; 		
					var _lowest_dist = infinity;
					var _lowest_direction = -1;
					for (var _player_index = 0; _player_index < array_length(player_infos); _player_index++) {
						if (player_infos[_player_index].ghost) {
							continue;
						}
						var _dist = point_distance(player_infos[_player_index].x_pos, player_infos[_player_index].y_pos, _enemy.x_pos, _enemy.y_pos);
						if (_dist < _lowest_dist) {
							_lowest_dist = _dist;
							_lowest_direction = point_direction(_enemy.x_pos, _enemy.y_pos, player_infos[_player_index].x_pos, player_infos[_player_index].y_pos);
				
						}
					}
					_enemy_instance.phy_rotation = -_lowest_direction;
					_enemy_instance.phy_speed_x = lengthdir_x(_enemy_speed, _lowest_direction);
					_enemy_instance.phy_speed_y = lengthdir_y(_enemy_speed, _lowest_direction);
				break;
			}
		}
		else {
			_enemy_instance.phy_position_x = _enemy.x_pos;
			_enemy_instance.phy_position_y = _enemy.y_pos;
		}
		
	}
	if (!paused) {
	move_enemies(enemy_infos);
	}
}