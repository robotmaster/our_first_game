// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function summon_enemy(_x, _y, _enemy_type, _owner) {
	var _hp; 
	var _new_id = -1;
	for (var _i = 0; _i < 100000; _i++) {
		if (!ds_map_exists(enemies_to_id, _i)) {
			var _new_id = _i;
			break;
		}
	}
	if (_new_id == -1) {
		return;
	}
	switch (_enemy_type) {
		case obj_death:
			var _type = 0;
			_hp = 15;
		break;
		case obj_enemy_basic:
			var _type = 1;
			_hp = 15;
		break;
		case obj_enemy_tank:
			var _type = 2;
			_hp = 25; 
		break;
		default:
			return;
	}
	
	array_push(enemy_infos, {this_id: _new_id, x_pos: _x, y_pos: _y, rot: 0, type: _type, this_health: _hp, max_health: _hp, owner: _owner});
	var _enemy = instance_create_layer(_x, _y, "collision_check", _enemy_type);
	if (_enemy.phy_active) {
		_enemy.phy_fixed_rotation = true;
	}
	ds_map_add(enemies_to_id, _new_id, _enemy);
}