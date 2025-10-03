// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function handle_bullets(_bullet_info) {
	with (obj_bullet) {
		exists = false;
	}
	for (var _bullet_index = 0; _bullet_index < array_length(_bullet_info); _bullet_index++) {
		var _bullet_id = _bullet_info[_bullet_index].this_id;
		var _bullet = ds_map_find_value(bullets_to_id, _bullet_id);
		if (is_undefined(_bullet) || !instance_exists(_bullet)) {
			show_debug_message("Broken bullets in handle_bullets")
		}
		_bullet.x = _bullet_info[_bullet_index].x_pos;
		_bullet.y = _bullet_info[_bullet_index].y_pos;
		_bullet.image_angle = _bullet_info[_bullet_index].angle;
		_bullet.this_id = _bullet_info[_bullet_index].this_id;
		_bullet.exists = true;
	}
	with (obj_bullet) {
		if (!exists) {
			instance_destroy();
		}
	}
}