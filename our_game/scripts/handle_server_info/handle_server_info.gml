// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function handle_server_info(_packet) {
	var _player_info = json_parse(read_packet(_packet, buffer_string));
		for (var _player_index = 0; _player_index < array_length(_player_info); _player_index++) {
			var _player_id = _player_info[_player_index].this_id;
			var _player = ds_map_find_value(players_to_id, _player_id);
			if (_player_id == id_player) {
				_player = obj_player.id;
				ping_timer = 0;
				
			}
			if (is_undefined(_player) || !instance_exists(_player)) {
				break;
			}
			if (_player_id == id_player) {
				if (!_player.ghost && _player_info[_player_index].ghost) {
					audio_play_sound(snd_death, 999, 0);
				}
				if (_player.ghost && !_player_info[_player_index].ghost) {
					audio_play_sound(snd_revive, 999, 0);
					obj_player.invincibility_frames = 180;
					obj_player.actual_x = _player_info[_player_index].revive_x;
					obj_player.actual_y = _player_info[_player_index].revive_y;
					obj_player.player_health = obj_player.max_health;
					
				}
			}
			_player.ghost = _player_info[_player_index].ghost;
			
			
			if (_player_id != id_player) {
				_player.actual_x = _player_info[_player_index].x_pos;
				_player.actual_y = _player_info[_player_index].y_pos;
				_player.player_health = _player_info[_player_index].player_health;
				_player.max_health = _player_info[_player_index].max_health;
				_player.player_angle = _player_info[_player_index].angle;
				_player.ghost = _player_info[_player_index].ghost;
			}
		}
		var _bullet_info = json_parse(read_packet(_packet, buffer_string));
		move_bullets(_bullet_info);
		var _enemy_info = json_parse(read_packet(_packet, buffer_string));
		move_enemies(_enemy_info);
		var _events = json_parse(read_packet(_packet, buffer_string));
		handle_events(_events);
}