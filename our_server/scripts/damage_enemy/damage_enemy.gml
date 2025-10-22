// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function damage_enemy(_obj, _bullet_index, _dmg) {
	for (var _enemy_index = 0; _enemy_index < array_length(other.enemy_infos); _enemy_index++) {
		var _enemy = other.enemy_infos[_enemy_index];
		if (_enemy.this_id == _obj.this_id) {
			_enemy.this_health -= _dmg;
			if (_enemy.this_health <= 0) {
				if (_enemy.type == 0) {
					with (obj_server) {
						revive_player(_enemy.owner);
					}
				}
				array_push(other.events, {this_id: event.hit, killed: true, bullet: other.bullet_infos[_bullet_index], enemy: _enemy});
				ds_map_delete(other.enemies_to_id, _obj.this_id);
				array_delete(other.enemy_infos, _enemy_index, 1);
				return true;
			}
			else {
				array_push(other.events, {this_id: event.hit, killed: false, bullet: other.bullet_infos[_bullet_index], enemy: _enemy});
				return false;
			}
		}
	}
}