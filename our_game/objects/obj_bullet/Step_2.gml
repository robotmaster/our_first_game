/// @description Insert description here
// You can write your code in this editor
image_angle = bullet_angle;
//x = round(tick_start_x + (actual_x - tick_start_x) * global.tick_timer / global.tick_timer_max);
//y = round(tick_start_y + (actual_y - tick_start_y) * global.tick_timer / global.tick_timer_max);
x = actual_x + start_difference_x * recover_timer / recover_time;
y = actual_y + start_difference_y * recover_timer / recover_time;