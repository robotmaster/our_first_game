/// @description Insert description here
// You can write your code in this editor
tick_timer_max = 1;
tick_timer = 0;



actual_x = x;
actual_y = y;
tick_start_x = actual_x;
tick_start_y = actual_y;

function tick() {
	if (keyboard_check(vk_left)) {
		actual_x -= 10;
	}
	if (keyboard_check(vk_right)) {
		actual_x += 10;
	}
	if (keyboard_check(vk_up)) {
		actual_y -= 10;
	}
	if (keyboard_check(vk_down)) {
		actual_y += 10;
	}
}