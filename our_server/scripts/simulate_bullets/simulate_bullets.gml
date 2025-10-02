// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function simulate_bullets() {
	for (var _bullet_index = 0; _bullet_index < array_length(bullet_infos); _bullet_index++) {
		var _bullet = bullet_infos[_bullet_index];
		
		var _bullet_speed = 40;
		_bullet.x_pos += lengthdir_x(_bullet_speed, _bullet.angle);
		_bullet.y_pos += lengthdir_y(_bullet_speed, _bullet.angle);
		
		
	}
	handle_bullets(bullet_infos);
}