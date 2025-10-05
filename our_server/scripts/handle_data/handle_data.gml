// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function handle_data() {
	var _packet = async_load[? "buffer"];
	safely_seek_start(_packet);
	var _packet_id = read_packet(_packet, buffer_u8);
	switch (_packet_id) {
		case networking.ticks:
			var _player_id = read_packet(_packet, buffer_u8);
			var _player_x = read_packet(_packet, buffer_s32);
			var _player_y = read_packet(_packet, buffer_s32);
			var _player_angle = read_packet(_packet, buffer_u16);
			var _will_shoot = read_packet(_packet, buffer_bool);
			var _died = read_packet(_packet, buffer_bool);
			
			ds_map_replace(player_ids_to_ping, _player_id, 0);
			
			
			for (var _player = 0; _player < array_length(player_infos); _player++) {
				if (player_infos[_player].this_id == _player_id) {
					
					
					player_infos[_player].x_pos = _player_x;
					player_infos[_player].y_pos = _player_y;
					player_infos[_player].angle = _player_angle;
					if (_died && !player_infos[_player].ghost) {
						player_infos[_player].ghost = true;
						player_infos[_player].revive_x = _player_x;
						player_infos[_player].revive_y = _player_y;
						summon_enemy(_player_x, _player_y, obj_death, _player_id);
						handle_loss();
					}
					if (_will_shoot) {
						handle_shooting(_player_x, _player_y, _player_angle, player_infos[_player].ghost);
				
					}
					break;
				}
			}
			
				
		break;
		default:
			show_debug_message("Invalid packet.");
		break;
	}
}