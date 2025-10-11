/// @description Insert description here
// You can write your code in this editor
effect_timer_max = 30;
effect_timer = effect_timer_max;

flash_timer_max = 12;
flash_timer = flash_timer_max;

hpbar_length = 60;

function draw_hp_bar() {
	draw_rectangle(x - hpbar_length/2, y - 50, x + hpbar_length/2, y - 60, true);
}