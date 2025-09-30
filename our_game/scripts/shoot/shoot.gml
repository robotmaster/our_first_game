// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function shoot(_x, _y, _start_x, _start_y, _angle) {
	var _bullet = instance_create_layer(actual_x, actual_y, "bullets", obj_bullet);
	_bullet.bullet_angle = player_angle;
	_bullet.image_angle = player_angle;
	_bullet.tick_start_x = actual_x;
	_bullet.tick_start_y = actual_y;
	_bullet.actual_x = actual_x;
	_bullet.actual_y = actual_y;
	array_push(global.bullet_entities, _bullet);
}