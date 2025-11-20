// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function simulate_enemies() {
	var _delta = delta_time / 1000000 * 60;
	with (obj_enemy_parent) {
		exists = false;
	}
	var _evolution_summon_queue = [];
	for (var _enemy_index = 0; _enemy_index < array_length(enemy_infos); _enemy_index++) {
		var _enemy = enemy_infos[_enemy_index];
		var _enemy_instance = ds_map_find_value(enemies_to_id, _enemy.this_id);
		if (is_undefined(_enemy_instance) || !instance_exists(_enemy_instance)) {
			show_debug_message("Broken enemies in simulate_enemies");
			show_debug_message(enemy_infos);
			show_debug_message(ds_map_size(enemies_to_id));
		}
		_enemy_instance.exists = true;
		if (paused) {
			if (_enemy_instance.phy_active) {
				_enemy_instance.phy_position_x = _enemy.x_pos;
				_enemy_instance.phy_position_y = _enemy.y_pos;
			}
			continue;
		}
			
		_enemy.speed_multiplier *= power(enemy_speed_increase_multiplier, _delta);
		_enemy.x_pos = _enemy_instance.x;
		_enemy.y_pos = _enemy_instance.y;
		_enemy.rot = _enemy_instance.image_angle;
		_enemy.evolution_time -= _delta;
		switch (_enemy.type) {
			case enemies.death:
			break;
			case enemies.basic:
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
				_enemy_instance.phy_speed_x = lengthdir_x(_enemy_speed * _enemy.speed_multiplier, _lowest_direction) / game_speed * 60;
				_enemy_instance.phy_speed_y = lengthdir_y(_enemy_speed * _enemy.speed_multiplier, _lowest_direction) / game_speed * 60;
				_enemy.speed_x = lengthdir_x(_enemy_speed * _enemy.speed_multiplier, _lowest_direction);
				_enemy.speed_y = lengthdir_y(_enemy_speed * _enemy.speed_multiplier, _lowest_direction);
			break;
			case enemies.tank:
				var _enemy_speed = 6;
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
				_enemy_instance.phy_speed_x = lengthdir_x(_enemy_speed * _enemy.speed_multiplier, _lowest_direction) / game_speed * 60;
				_enemy_instance.phy_speed_y = lengthdir_y(_enemy_speed * _enemy.speed_multiplier, _lowest_direction) / game_speed * 60;
				_enemy.speed_x = lengthdir_x(_enemy_speed * _enemy.speed_multiplier, _lowest_direction);
				_enemy.speed_y = lengthdir_y(_enemy_speed * _enemy.speed_multiplier, _lowest_direction);
			break;
			case enemies.rock:
				_enemy_instance.phy_speed_x = 0;
				_enemy_instance.phy_speed_y = 0;
			break;
		}
		if (_enemy.evolution_time <= 0 && global.evolution_info[_enemy.type].next != noone) {
			array_push(_evolution_summon_queue, {x_pos: _enemy.x_pos, y_pos: _enemy.y_pos, type: global.evolution_info[_enemy.type].next});
			instance_destroy(_enemy_instance);
			ds_map_delete(obj_server.enemies_to_id, _enemy.this_id);
			array_delete(obj_server.enemy_infos, _enemy_index, 1);
			_enemy_index--;
		}
		
		
	}
	with (obj_enemy_parent) {
		if (!exists) {
			instance_destroy();
		}
	}
	for (var _i = 0; _i < array_length(_evolution_summon_queue); _i++) {
		var _info = _evolution_summon_queue[_i];
		summon_enemy(_info.x_pos, _info.y_pos, _info.type, -1);
	}
}