// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function handle_shooting(_x, _y, _angle) {
	var _new_id = -1;
	for (var _i = 0; _i < 1000; _i++) {
		if (!array_contains(bullet_ids, _i)) {
			var _new_id = _i;
			break;
		}
	}
	if (_new_id == -1) {
		return;
	}
	array_push(bullet_ids, _new_id);
	array_push(bullet_infos, {this_id: _new_id, x_pos: _x, y_pos: _y, angle: _angle});
}