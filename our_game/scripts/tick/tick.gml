// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function tick() {
	//only use with obj_player
	//tick_start_x = actual_x;
	//tick_start_y = actual_y;
	var _player_info = {
	this_id: obj_client.id_player,
	x_pos: actual_x,
	y_pos: actual_y,
	angle: player_angle,
	this_health: player_health,
	max_health: max_health,
	died: false
	};
	
	var _bullet_info = {
	shot: false,
	type: 0,
	damage: 100
	};
	
	
	actual_x = x;
	actual_y = y;
	if (obj_client.paused) {
		send_packet(obj_client.client_socket, [
		[buffer_u8, networking.ticks],
		[buffer_string, _player_info],
		[buffer_string, _bullet_info],
		]);
		return;
	}
	
	
	handle_player_movement();
		
	
	invincibility_frames = timer(invincibility_frames, 1);
	
	hurt_timer = timer(hurt_timer, 1);
	if (!ghost) {
		if (handle_damage() && hurt_timer <= 0) {
			hurt_timer = hurt_timer_max;
			var _sound = audio_play_sound(snd_damage, 10, 0);
			audio_sound_pitch(_sound, random_range(0.9, 1.1));
		}
	}
	if (obj_player.player_health <= 0 && !ghost) {
		_player_info.died = true;
		obj_player.player_health = 0;
	}
	else {
		if (handle_shooting()) {
			_bullet_info.shot = true;
			if (ds_map_exists(stats.powerups, powerup.pierce)) {
				aoe_shot_timer = timer(aoe_shot_timer, 1);
				if (aoe_shot_timer <= 0) {
					aoe_shot_timer = aoe_shot_timer_max;
					_bullet_info.type = 1;
					_bullet_info.damage = 300;
				}
			}
		}
	}
	if (ds_map_exists(stats.powerups, powerup.attack_damage)) {
		_bullet_info.damage = round(_bullet_info.damage * power(powerup_attack_damage_multiplier, ds_map_find_value(stats.powerups, powerup.attack_damage)));
	}
	send_packet(obj_client.client_socket, [
	[buffer_u8, networking.ticks],
	[buffer_string, json_stringify(_player_info)],
	[buffer_string, json_stringify(_bullet_info)],
	]);
	
}