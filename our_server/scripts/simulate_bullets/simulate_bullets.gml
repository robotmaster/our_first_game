// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function simulate_bullets() {
	if (paused) {
		return;
	}
	for (var _bullet_index = 0; _bullet_index < array_length(bullet_infos); _bullet_index++) {
		var _bullet = bullet_infos[_bullet_index];
		
		var _bullet_speed = 40;
		_bullet.x_pos += lengthdir_x(_bullet_speed, _bullet.angle);
		_bullet.y_pos += lengthdir_y(_bullet_speed, _bullet.angle);
		_bullet.despawn_timer = timer(_bullet.despawn_timer, 1);
		if (_bullet.despawn_timer <= 0) {
			ds_map_delete(bullets_to_id, _bullet.this_id);
			array_delete(bullet_infos, _bullet_index, 1);
			_bullet_index -= 1;
		}
		
	}
		
		
	move_bullets(bullet_infos);
	
	
	
	with (obj_bullet) {
		for (var _bullet_index = 0; _bullet_index < array_length(other.bullet_infos); _bullet_index++) {
			if (other.bullet_infos[_bullet_index].this_id == this_id) {
				var _bullet_info_index = _bullet_index;
			}
		}
		if (other.bullet_infos[_bullet_info_index].ghost) {
			var _obj = instance_place(x, y, obj_enemy_no_death_parent);
		}
		else {
			var _obj = instance_place(x, y, obj_enemy_parent);
		}
		if (_obj != noone) {
			for (var _enemy_index = 0; _enemy_index < array_length(other.enemy_infos); _enemy_index++) {
				var _enemy = other.enemy_infos[_enemy_index];
				if (_enemy.this_id == _obj.this_id) {
					_enemy.this_health -= 1;
					if (_enemy.this_health <= 0) {
						if (_enemy.type == 0) {
							with (obj_server) {
								revive_player(_enemy.owner);
							}
						}
						array_push(other.events, {this_id: event.hit, killed: true, bullet: other.bullet_infos[_bullet_info_index], enemy: _enemy});
						ds_map_delete(other.enemies_to_id, _obj.this_id);
						array_delete(other.enemy_infos, _enemy_index, 1);
					}
					else {
						array_push(other.events, {this_id: event.hit, killed: false, bullet: other.bullet_infos[_bullet_info_index], enemy: _enemy});
					}
					break;
				}
			}
			
			ds_map_delete(other.bullets_to_id, this_id);
			array_delete(other.bullet_infos, _bullet_info_index, 1);
			instance_destroy();
			break;
		}
	}
	
}