// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function handle_shooting() {
	reload_cooldown = timer(reload_cooldown, 1);
	if (player_mag_capacity <= 0 && reload_cooldown <= 0) { 
		player_mag_capacity = player_bullet_capacity;
	}
	
	shoot_cooldown = timer(shoot_cooldown, 1);
	if (!mouse_check_button(mb_left) || shoot_cooldown > 0) {
		return false;
	}
	shoot_cooldown = shoot_cooldown_max;
	if (player_mag_capacity <= 0) {
		return false;
	}
	
	player_mag_capacity--;
	if (player_mag_capacity <= 0 && reload_cooldown <= 0) {
		reload_cooldown = reload_cooldown_max;
	}
	return true;
}