/// @description Insert description here
// You can write your code in this editor
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(fnt_damage_number);
draw_set_alpha((effect_timer_max - effect_timer) / effect_timer_max)
draw_text(x, y, number);
draw_set_alpha(1);