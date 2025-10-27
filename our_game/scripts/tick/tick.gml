// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function tick() {
	//only use with obj_player
	//tick_start_x = actual_x;
	//tick_start_y = actual_y;
	actual_x = x;
	actual_y = y;
	if (obj_client.paused) {
		send_packet(obj_client.client_socket, [
	[buffer_u8, networking.ticks],
	[buffer_u8, obj_client.id_player],
	[buffer_s32, actual_x],
	[buffer_s32, actual_y],
	[buffer_u16, player_angle],
	[buffer_u16, player_health],
	[buffer_u16, max_health],
	[buffer_bool, false],
	[buffer_bool, 0],
	[buffer_bool, false],
	[buffer_u16, 0],
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
	var _died = false;
	var _shot = false;
	var _bullet_type = 0;
	var _bullet_damage = 1;
	if (obj_player.player_health <= 0 && !ghost) {
		_died = true;
		obj_player.player_health = 0;
	}
	else {
		if (handle_shooting()) {
			_shot = true;
			if (ds_map_exists(stats.powerups, powerup.pierce)) {
				aoe_shot_timer = timer(aoe_shot_timer, 1);
				if (aoe_shot_timer <= 0) {
					aoe_shot_timer = aoe_shot_timer_max;
					_bullet_type = 1;
					_bullet_damage = 3;
				}
			}
		}
	}
	if (ds_map_exists(stats.powerups, powerup.attack_damage)) {
		_bullet_damage = round(_bullet_damage * power(powerup_attack_damage_multiplier, ds_map_find_value(stats.powerups, powerup.attack_damage)));
	}
	
	send_packet(obj_client.client_socket, [
	[buffer_u8, networking.ticks],
	[buffer_u8, obj_client.id_player],
	[buffer_s32, actual_x],
	[buffer_s32, actual_y],
	[buffer_u16, player_angle],
	[buffer_u16, player_health],
	[buffer_u16, max_health],
	[buffer_bool, _shot],
	[buffer_u8, _bullet_type],
	[buffer_bool, _died],
	[buffer_u16, _bullet_damage],
	]);
	
}