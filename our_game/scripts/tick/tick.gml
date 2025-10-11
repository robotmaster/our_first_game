// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function tick() {
	//only use with obj_player
	tick_start_x = actual_x;
	tick_start_y = actual_y;
	var _packet_info = [
	[buffer_u8, networking.ticks],
	[buffer_u8, obj_client.id_player],
	[buffer_s32, actual_x],
	[buffer_s32, actual_y],
	[buffer_u16, player_angle],
	[buffer_bool, false],//shoot
	[buffer_bool, false],//died
	];
	if (obj_client.paused) {
		send_packet(obj_client.client_socket, _packet_info);
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
		_packet_info[6][1] = true;
		obj_player.player_health = 0;
	}
	else {
		if (handle_shooting()) {
			_packet_info[5][1] = true;
		}
	}
	
	
	send_packet(obj_client.client_socket, _packet_info);
	
}