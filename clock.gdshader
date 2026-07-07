shader_type canvas_item;

const float SMOOTHING = 1.5;
const float RING_THICKNESS = 0.1;

float smooth_above(float threshold, float value){
	return smoothstep(threshold, threshold + fwidth(SMOOTHING * value), value);
}

float smooth_below(float threshold, float value){
	return smoothstep(threshold, threshold - fwidth(SMOOTHING * value), value);
}

float get_ring_weight(float start_radius, float radius){
	return(
		smooth_above(start_radius, radius)*
		smooth_below(start_radius + RING_THICKNESS, radius)	
	);
}

void fragment(){
	//COLOR.rgb = vec3(step(smoothstep(0.0,1.0, UV.x), UV.y));
	float radius = 2.0 * distance(UV, vec2(0.5));
	COLOR = vec4(1.0);
	//float mixer = smoothstep(0.5, 0.6, radius);
	//float mixer = smoothstep(0.5, 0.5 + fwidth(1.5 * radius), radius);
	float mixer = get_ring_weight(0.5, radius);
	COLOR.rgb = mix(COLOR.rgb, vec3(0.0, 0.5, 0.0), mixer);
	COLOR.a = smooth_below(1.0, radius);
	//COLOR.rgb *= radius;
}
