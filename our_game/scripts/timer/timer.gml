// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function timer(_timer, _decrease) {
	if (_timer - _decrease <= 0) {
		return 0;
	}
	return _timer - _decrease;
}