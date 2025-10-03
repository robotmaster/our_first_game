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
			_enemy = instance_create_layer(_enemy_info[_enemy_index].x_pos, _enemy_info[_enemy_index].y_pos, "enemies", obj_enemy);
			if (ds_map_exists(enemies_to_id, _enemy_id)) {
				ds_map_delete(enemies_to_id, _enemy_id);
			}
			ds_map_add(enemies_to_id, _enemy_id, _enemy);
		}
		_enemy.actual_x = _enemy_info[_enemy_index].x_pos;
		_enemy.actual_y = _enemy_info[_enemy_index].y_pos;
		_enemy.rotation_ = _enemy_info[_enemy_index].rot;
		_enemy.enemy_health = _enemy_info[_enemy_index].this_health;
		_enemy.this_id = _enemy_info[_enemy_index].this_id;
		_enemy.exists = true;
	}
	with (obj_enemy) {
		if (!exists) {
			instance_destroy();
		}
	}
}