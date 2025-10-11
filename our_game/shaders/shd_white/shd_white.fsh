//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform float u_white_mix; // 0..1

void main() {
    vec4 tex = texture2D(gm_BaseTexture, v_vTexcoord) * v_vColour;
    tex.rgb = mix(tex.rgb, vec3(1.0), clamp(u_white_mix, 0.0, 1.0));
    gl_FragColor = tex; // keep the original alpha
}