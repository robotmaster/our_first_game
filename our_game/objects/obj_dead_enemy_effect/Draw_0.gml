/// @description Insert description here
// You can write your code in this editor
shader_set(shd_white);
var _u = shader_get_uniform(shd_white, "u_white_mix");
shader_set_uniform_f(_u, flash_timer > 0);
draw_self();
shader_reset();