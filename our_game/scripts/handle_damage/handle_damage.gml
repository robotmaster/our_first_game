// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function handle_damage(){
	invincibility_frames = timer(invincibility_frames, 1);
	if (invincibility_frames <= 0) {
		with (obj_enemy) {
			if (place_meeting(x, y, obj_player)) {
				obj_player.player_health -= 1;
			}
		}
	}
	
	
	if (obj_player.player_health <= 0) {
		with (obj_client) {
			reset_game();
		}
	}
}