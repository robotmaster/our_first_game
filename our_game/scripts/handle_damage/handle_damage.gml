// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function handle_damage() {
	var _hurt = false;
	invincibility_frames = timer(invincibility_frames, 1);
	if (invincibility_frames <= 0) {
		with (obj_enemy_no_death_parent) {
			if (place_meeting(x, y, obj_player)) {
				if (object_index == obj_enemy_basic) {
					obj_player.player_health -= 1;
				}
				else if (object_index == obj_enemy_tank) {
					obj_player.player_health -= 3;
				}
				_hurt = true;
			}
		}
	}
	return _hurt;
}