shader_type spatial;
render_mode depth_draw_never, specular_disabled, ambient_light_disabled, diffuse_lambert;

//uniform sampler2D texture_albedo : source_color, filter_nearest;
//uniform float alpha_scissor_threshold : hint_range(0.0, 1.0) = 0.5;
//uniform sampler2D target_albedo_texture : source_color, filter_linear_mipmap;
uniform vec4 target_color : source_color = vec4(1.0);

void vertex() {
	// Called for every vertex the material is visible on.
	
	// Billboarding
	// Get the world position into view space cleanly
    vec4 origin = MODELVIEW_MATRIX * vec4(0.0, 0.0, 0.0, 1.0);

    MODELVIEW_MATRIX[0] = vec4(1.0, 0.0, 0.0, 0.0);
    MODELVIEW_MATRIX[1] = vec4(0.0, 1.0, 0.0, 0.0);
    MODELVIEW_MATRIX[2] = vec4(0.0, 0.0, 1.0, 0.0);
    MODELVIEW_MATRIX[3] = origin;
}

void fragment() {
	// Called for every pixel the material is visible on.
	
	// Alpha scissor thing
	//vec4 albedo_tex = texture(texture_albedo, UV);
	//ALBEDO = albedo_tex.rgb;
	//ALPHA = albedo_tex.a;
	//ALPHA_SCISSOR_THRESHOLD = alpha_scissor_threshold;
	
	// Matching texture color to floor color
	//vec4 tex_color = texture(target_albedo_texture, UV);
	//ALBEDO = tex_color.rgb;
	
	vec3 base_color = vec3(1.0, 1.0, 1.0); // Replace with your texture or albedo
	
	ALBEDO = target_color.rgb;
}

void light() {
	// Called for every pixel for every light affecting the material.

    // If this light is casting a shadow on any part, darken the whole object
    if (ATTENUATION < 1.0) {
        DIFFUSE_LIGHT += LIGHT_COLOR * ALBEDO * 0.1;
    } else {
        DIFFUSE_LIGHT += LIGHT_COLOR * ALBEDO;
    }
}
