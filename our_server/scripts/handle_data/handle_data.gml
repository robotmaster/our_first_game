// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function handle_data() {
	var _packet = async_load[? "buffer"];
	safely_seek_start(_packet);
	var _packet_id = read_packet(_packet, buffer_u8);
	
	switch (_packet_id) {
		case networking.ticks:
		
			var _player_info = json_parse(read_packet(_packet, buffer_string));
			var _bullet_info = json_parse(read_packet(_packet, buffer_string));
			var _player_id = _player_info.this_id;
			var _player_x = _player_info.x_pos;
			var _player_y = _player_info.y_pos;
			var _player_angle = _player_info.angle;
			var _player_health = _player_info.this_health;
			var _max_health = _player_info.max_health;
			var _died = _player_info.died;
			var _will_shoot = _bullet_info.shot;
			var _bullet_type = _bullet_info.type;
			var _bullet_damage = _bullet_info.damage;
		
			
			
			for (var _player = 0; _player < array_length(player_infos); _player++) {
				if (player_infos[_player].this_id != _player_id) {
					continue;
				}
				player_infos[_player].ping_timer = 0;
					
				player_infos[_player].x_pos = _player_x;
				player_infos[_player].y_pos = _player_y;
				player_infos[_player].angle = _player_angle;
				player_infos[_player].player_health = _player_health;
				player_infos[_player].max_health = _max_health;
				if (_died && !player_infos[_player].ghost) {
					player_infos[_player].ghost = true;
					player_infos[_player].revive_x = _player_x;
					player_infos[_player].revive_y = _player_y;
					summon_enemy(_player_x, _player_y, obj_death, _player_id);
					handle_loss();
				}
				if (_will_shoot) {
					handle_shooting(_player_x, _player_y, _bullet_damage, _bullet_type, _player_angle, player_infos[_player].ghost, _player_id);
				
				}
				break;
			}
				
		break;
		case networking.pause:
			paused ^= true;
			send_packet_to_all([
			[buffer_u8, networking.pause]
			]);
		break;
		default:
			show_debug_message("Invalid packet.");
		break;
	}
}