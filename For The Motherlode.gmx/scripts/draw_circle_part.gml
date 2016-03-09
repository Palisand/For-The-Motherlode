/* draw_circle_part(x,y,r,ang,off,outline) */
var X,Y,r,ang,off,outline,i;
i=0;
X=argument0; //x position
Y=argument1; //y position
r=argument2; // radius
ang=argument3; // angle of the circle drawn
off=argument4; // offset angle to draw the part
outline=argument5; // whether to only draw an outline T/F 
if!(outline){
draw_primitive_begin(pr_trianglefan);
draw_vertex(X,Y);
} else
draw_primitive_begin(pr_linestrip);
draw_vertex(X+lengthdir_x(r,off),Y+lengthdir_y(r,off));
repeat(abs(ang)mod 360){
draw_vertex(X+lengthdir_x(r,i+off),Y+lengthdir_y(r,i+off));
i+=1*sign(ang);
}
draw_primitive_end();
