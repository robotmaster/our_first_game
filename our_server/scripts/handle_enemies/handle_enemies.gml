// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function handle_enemies(_enemy_info) {
	with (obj_enemy) {
		exists = false;
	}
	for (var _enemy_index = 0; _enemy_index < array_length(_enemy_info); _enemy_index++) {
		var _enemy_id = _enemy_info[_enemy_index].this_id;
		var _enemy = ds_map_find_value(enemies_to_id, _enemy_id);
		if (is_undefined(_enemy) || !instance_exists(_enemy)) {
			show_debug_message("Broken enemies in handle_enemies");
		}
		_enemy.x = _enemy_info[_enemy_index].x_pos;
		_enemy.y = _enemy_info[_enemy_index].y_pos;
		_enemy.image_angle = _enemy_info[_enemy_index].rot; 
		_enemy.this_id = _enemy_info[_enemy_index].this_id;
		_enemy.exists = true;
	}
	with (obj_enemy) {
		if (!exists) {
			instance_destroy();
		}
	}
}