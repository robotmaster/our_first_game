// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function handle_events(_events) {
	for (var _event_index = 0; _event_index < array_length(_events); _event_index++) {
		var _event = _events[_event_index];
		switch (_event.this_id) {
			case event.hit:
				if (_event.killed && _event.enemy.type != 0) {
					obj_player.stats.total_killed ++;
					if (_event.bullet.owner == id_player) {
						obj_player.stats.my_killed ++;
					}
					var _effect = instance_create_layer(_event.enemy.x_pos, _event.enemy.y_pos, "effects", obj_dead_enemy_effect);
					_effect.image_angle = _event.enemy.rot;
					_effect.speed_x = _event.enemy.speed_x;
					_effect.speed_y = _event.enemy.speed_y;
					switch (_event.enemy.type) {
						case enemies.death:
							_effect.sprite_index = spr_death;
						break;
						case enemies.basic:
							_effect.sprite_index = spr_enemy;
						break;
						case enemies.tank:
							_effect.sprite_index = spr_enemy_tank;
						break;
						case enemies._speed:
							_effect.sprite_index = spr_enemy_speed;
						break;
						case enemies.rock:
							_effect.sprite_index = spr_rock;
							if (_event.bullet.owner == id_player) {
								if (!ds_map_exists(obj_player.stats.powerups, powerup.pierce)) {
									add_powerup(powerup.pierce);
								}
								else {
									add_powerup(powerup.attack_damage);
								}
							}
						break;
						default:
							show_debug_message("Got invalid dead enemy in handle_events");
							_effect.sprite_index = spr_enemy;
					}
				}
				var _enemy_instance = ds_map_find_value(enemies_to_id, _event.enemy.this_id);
				if (is_undefined(_enemy_instance) || !instance_exists(_enemy_instance)) {
					break;
				}
				if (_enemy_instance.damage_number_cooldown <= 0 || _event.bullet.damage > _enemy_instance.damage_number_cooldown_amount) {
					var _num = instance_create_layer(_event.bullet.x_pos, _event.bullet.y_pos, "damage_nums", obj_damage_number);
					_num.number = _event.bullet.damage;
					var _number_speed = 10;
					_num.speed_x = lengthdir_x(_number_speed, _event.bullet.angle);
					_num.speed_y = lengthdir_y(_number_speed, _event.bullet.angle);
					_num.x += _num.speed_x * 2;
					_num.y += _num.speed_y * 2;
					_enemy_instance.damage_number_cooldown = 5;
					_enemy_instance.damage_number_cooldown_amount = _event.bullet.damage;
				}
			break;
			default:
				show_debug_message("Issue with handle_events");
		}
	}
	/*
	if (object_index != obj_death) {
		obj_player.stats.total_killed ++;
	}*/
}