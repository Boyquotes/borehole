shader_type spatial;

uniform float scale = 1.0;
uniform sampler2D mask: source_color;

void fragment() {
	vec4 mask_text = texture(mask, UV * vec2(1.0, scale));
	ALBEDO.rgb = mask_text.rgb;
}