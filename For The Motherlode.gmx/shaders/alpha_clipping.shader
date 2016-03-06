//
// Simple passthrough vertex shader
//
attribute vec3 in_Position;                  // (x,y,z)
//attribute vec3 in_Normal;                  // (x,y,z)     unused in this shader.	
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~//
//  Make transparent the pixels who's R value is less than in_Fade, and color the rest in_Colour
//

uniform float in_Fade;
uniform vec3 in_Colour;

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
    
    float intt = 0.0;
    
    if ( gl_FragColor.r > in_Fade ) { intt = 1.0; }
    if ( gl_FragColor.r <= in_Fade ) { intt = 0.0; }
        
    gl_FragColor = vec4( in_Colour.r, in_Colour.g, in_Colour.b, intt );
}

