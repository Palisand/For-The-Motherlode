///draw_annulus(x, y, inner_radius, outer_radius, startangle, endangle[, precision]) */
var cx, cy, irad, orad, prec, dir, inout, rad, theta1, theta1;

/* Just grab the arguments */
cx=argument0;
cy=argument1;
irad=argument2;
orad=argument3;
theta1=min(argument4, argument5);
theta2=max(argument4, argument5);
prec=argument6;
if (prec<=0) { prec=0.5; }

/* Draw the annulus */
draw_primitive_begin(pr_trianglestrip);

var center_offset = 1;  // added by me with no idea why it is necessary
for ({dir=theta1; inout=0}; dir<=theta2; {dir+=prec; inout++}) {
  if (inout % 2) {
    draw_vertex(cx + center_offset + lengthdir_x(irad, dir), cy + center_offset + lengthdir_y(irad, dir));
  }
  else {
    draw_vertex(cx + center_offset + lengthdir_x(orad, dir), cy + center_offset + lengthdir_y(orad, dir));
  }
}

/* This just makes sure it always ends on the inner ring so it doesn't leave gaps. */
if (inout % 2) {
  draw_vertex(cx + lengthdir_x(irad, dir), cy + lengthdir_y(irad, dir));
}

draw_primitive_end();
