// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function summon_enemy(_x, _y) {
	var _new_id = -1;
	for (var _i = 0; _i < 1000; _i++) {
		if (!ds_map_exists(enemies_to_id, _i)) {
			var _new_id = _i;
			break;
		}
	}
	if (_new_id == -1) {
		return;
	}
	array_push(enemy_infos, {this_id: _new_id, x_pos: _x, y_pos: _y, rot: 0, this_health: 15});
	var _enemy = instance_create_layer(_x, _y, "collision_check", obj_enemy);
	ds_map_add(enemies_to_id, _new_id, _enemy);
}