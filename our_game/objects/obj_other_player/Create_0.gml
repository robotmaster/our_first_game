/// @description Insert description here
// You can write your code in this editor
global.tick_timer_max = 1;
global.tick_timer = 0;

actual_x = x;
actual_y = y;

tick_start_x = actual_x;
tick_start_y = actual_y;

invincibility_frames = 0;

ghost = false;

player_angle = image_angle;

max_health = 0;
player_health = 0;
hpbar_length = 100;

function draw_hp_bar() {
	draw_rectangle(actual_x - hpbar_length/2, actual_y - 50, actual_x + hpbar_length/2, actual_y - 60, true);
	draw_rectangle(actual_x - hpbar_length/2, actual_y - 50, actual_x - hpbar_length/2 + hpbar_length/max_health*player_health, actual_y -60, false)
}
