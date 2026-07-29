shader_type canvas_item;

uniform vec4 outline_color : source_color = vec4(1.0, 1.0, 1.0, 1.0);
uniform float outline_width : hint_range(0.0, 5.0) = 1.0;
uniform bool outline_enabled = false;

void fragment() {
	vec4 tex_color = texture(TEXTURE, UV);
	
	if (outline_enabled) {
		vec2 pixel_size = outline_width / vec2(textureSize(TEXTURE, 0));
		
		float alpha_up    = texture(TEXTURE, UV + vec2(0.0, -pixel_size.y)).a;
		float alpha_down  = texture(TEXTURE, UV + vec2(0.0, pixel_size.y)).a;
		float alpha_left  = texture(TEXTURE, UV + vec2(-pixel_size.x, 0.0)).a;
		float alpha_right = texture(TEXTURE, UV + vec2(pixel_size.x, 0.0)).a;
		
		float neighbor_alpha = max(max(alpha_up, alpha_down), max(alpha_left, alpha_right));
		
		if (tex_color.a < 0.5 && neighbor_alpha > 0.5) {
			COLOR = outline_color;
		} else {
			COLOR = tex_color;
		}
	} else {
		COLOR = tex_color;
	}
}