// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function shoot(_x, _y, _start_x, _start_y, _angle) {
	//only use with obj_player
	if (player_mag_storage <= 0) {
		return; 
	}
	var _bullet = instance_create_layer(_x, _y, "bullets", obj_bullet);
	_bullet.bullet_angle = _angle;
	_bullet.image_angle = _angle;
	_bullet.tick_start_x = _x;
	_bullet.tick_start_y = _y;
	_bullet.actual_x = _x;
	_bullet.actual_y = _y;
	_bullet.start_difference_x = _start_x - _x;
	_bullet.start_difference_y = _start_y - _y;
	player_mag_storage -= 1; 
	array_push(global.bullet_entities, _bullet);
}