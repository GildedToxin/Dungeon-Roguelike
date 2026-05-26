shader_type spatial;
render_mode depth_draw_never, specular_disabled, ambient_light_disabled, diffuse_lambert;

// Assign a ViewportTexture pointing at a top-down camera above the ground
uniform sampler2D ground_texture : source_color, hint_default_white;

//uniform sampler2D texture_albedo : source_color, filter_nearest;
//uniform float alpha_scissor_threshold : hint_range(0.0, 1.0) = 0.5;
uniform vec2 ground_min; // world x and z min
uniform vec2 ground_max; // world X and Z max

uniform float roughness : hint_range(0.0, 1.0) = 0.8;

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
	
	// Reconstruct world XZ position from the model matrix
    vec3 world_pos = (MODEL_MATRIX * vec4(VERTEX, 1.0)).xyz;

    // Remap world XZ to UV [0,1]
    vec2 uv = (world_pos.xz - ground_min) / (ground_max - ground_min);

    vec4 ground_color = texture(ground_texture, uv);

    ALBEDO = ground_color.rgb;
    ROUGHNESS = roughness;
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
