shader_type canvas_item;

void fragment(){
	float radius = 2.0 * distance(UV, vec2(0.5));
	COLOR = vec4(1.0);
	if(radius > 0.5){
		COLOR.rgb = vec3(0.0, 0.5, 0.0);
	}
	//COLOR.rgb *= radius;
}
