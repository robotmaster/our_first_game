// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function move_enemies(_enemy_info) {
	with (obj_enemy_parent) {
		exists = false;
	}
	for (var _enemy_index = 0; _enemy_index < array_length(_enemy_info); _enemy_index++) {
		var _enemy_id = _enemy_info[_enemy_index].this_id;
		var _enemy = ds_map_find_value(enemies_to_id, _enemy_id);
		var _enemy_type = _enemy_info[_enemy_index].type;
		if (is_undefined(_enemy) || !instance_exists(_enemy) || _enemy.type != _enemy_type) {
			var _x_pos = _enemy_info[_enemy_index].x_pos;
			var _y_pos = _enemy_info[_enemy_index].y_pos;
			switch (_enemy_type) {
				case enemies.death:
					_enemy = instance_create_layer(_x_pos, _y_pos, "death", obj_death);
				break;
				case enemies.basic:
					_enemy = instance_create_layer(_x_pos, _y_pos, "enemies", obj_enemy_basic);
				break;
				case enemies.tank:
					_enemy = instance_create_layer(_x_pos, _y_pos, "enemies", obj_enemy_tank);
				break;
				case enemies._speed:
					_enemy = instance_create_layer(_x_pos, _y_pos, "enemies", obj_enemy_speed);
				break;
				case enemies.rock:
					_enemy = instance_create_layer(_x_pos, _y_pos, "enemies", obj_rock);
				break;
				default:
					show_debug_message("Received invalid enemy");
					return;
			}
			if (_enemy.phy_active) {
				_enemy.phy_fixed_rotation = true;
			}
			
			
			if (ds_map_exists(enemies_to_id, _enemy_id)) {
				ds_map_delete(enemies_to_id, _enemy_id);
			}
			ds_map_add(enemies_to_id, _enemy_id, _enemy);
		}
		if (_enemy.phy_active) {
			_enemy.phy_position_x = _enemy_info[_enemy_index].x_pos;
			_enemy.phy_position_y = _enemy_info[_enemy_index].y_pos;
		}
		_enemy.this_id = _enemy_info[_enemy_index].this_id;
		_enemy.this_id = _enemy_info[_enemy_index].this_id;
		_enemy.actual_x = _enemy_info[_enemy_index].x_pos;
		_enemy.actual_y = _enemy_info[_enemy_index].y_pos;
		_enemy.rotation_ = _enemy_info[_enemy_index].rot;
		_enemy.type = _enemy_info[_enemy_index].type;
		if (_enemy.enemy_health > _enemy_info[_enemy_index].this_health) {
			_enemy.flash_timer = _enemy.flash_timer_max;
		}
		_enemy.enemy_health = _enemy_info[_enemy_index].this_health;
		_enemy.max_health = _enemy_info[_enemy_index].max_health; 
		_enemy.exists = true;
	}
	with (obj_enemy_parent) {
		if (!exists) {
			instance_destroy();
		}
	}
}