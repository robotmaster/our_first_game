// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function simulate_bullets() {
	for (var _bullet_index = 0; _bullet_index < array_length(bullet_infos); _bullet_index++) {
		var _bullet = bullet_infos[_bullet_index];
		
		var _bullet_speed = 40;
		_bullet.x_pos += lengthdir_x(_bullet_speed, _bullet.angle);
		_bullet.y_pos += lengthdir_y(_bullet_speed, _bullet.angle);
		_bullet.despawn_timer = timer(_bullet.despawn_timer, 1);
		if (_bullet.despawn_timer <= 0) {
			array_delete(bullet_infos, _bullet_index, 1);
			_bullet_index -= 1;
		}
		
	}
	handle_bullets(bullet_infos);
	with (obj_bullet) {
		var _obj = instance_place(x, y, obj_enemy);
		if (_obj != noone) {
			for (var _enemy_index = 0; _enemy_index < array_length(other.enemy_infos); _enemy_index++) {
				if (other.enemy_infos[_enemy_index].this_id == _obj.this_id) {
					other.enemy_infos[_enemy_index].this_health -= 1;
					if (other.enemy_infos[_enemy_index].this_health <= 0) {
						array_delete(other.enemy_infos, _enemy_index, 1);
					}
					break;
				}
			}
			for (var _bullet_index = 0; _bullet_index < array_length(other.bullet_infos); _bullet_index++) {
				if (other.bullet_infos[_bullet_index].this_id == this_id) {
					array_delete(other.bullet_infos, _bullet_index, 1);
					instance_destroy();
					break;
				}
			}
		}
	}
	
}