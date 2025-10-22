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
	
	
	
	with (obj_bullet_parent) {
		for (var _bullet_index = 0; _bullet_index < array_length(other.bullet_infos); _bullet_index++) {
			if (other.bullet_infos[_bullet_index].this_id == this_id) {
				var _bullet_info_index = _bullet_index;
			}
		}
		var _obj_list = ds_list_create();;
		if (other.bullet_infos[_bullet_info_index].ghost) {
			instance_place_list(x, y, obj_enemy_no_death_parent, _obj_list, false);
		}
		else {
			instance_place_list(x, y, obj_enemy_parent, _obj_list, false);
		}
		
		
		if (ds_list_size(_obj_list) != 0) {
			switch (type) {
				case 0:
					damage_enemy(ds_list_find_value(_obj_list, 0), _bullet_info_index, 1);
				break;
				case 1:
					for (var _enemy_index = 0; _enemy_index < array_length(other.enemy_infos); _enemy_index++) {
						var _enemy = other.enemy_infos[_enemy_index];
						if (!array_contains(other.bullet_infos[_bullet_info_index].hit_enemies, _enemy.this_id)) {
							if (damage_enemy(ds_map_find_value(other.enemies_to_id, other.enemy_infos[_enemy_index].this_id), _bullet_info_index, 3)) {
								_enemy_index -= 1;
							}
							array_push(other.bullet_infos[_bullet_info_index].hit_enemies, _enemy.this_id);
						}
					}
				break;
			}	
			
			
			
			if (type == 0) {
				ds_map_delete(other.bullets_to_id, this_id);
				array_delete(other.bullet_infos, _bullet_info_index, 1);
				instance_destroy();
			}
			break;
		}
		ds_list_destroy(_obj_list);
	}
	
}