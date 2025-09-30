/// @description Insert description here
// You can write your code in this editor
tick_start_x = actual_x;
tick_start_y = actual_y;
actual_x += lengthdir_x(bullet_speed, bullet_angle);
actual_y += lengthdir_y(bullet_speed, bullet_angle);

recover_timer = timer(recover_timer, 1);