// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function shoot() {
	//only use with obj_player
	var _bullet = instance_create_layer(actual_x, actual_y, "bullets", obj_bullet);
	_bullet.image_angle = player_angle;
}