///textbox( border width, border height, x, y, string )


/* set horizontal alignment */ draw_set_halign(fa_left);

/* set vertical alignment */ draw_set_valign(fa_center);

draw_set_color(c_white);
draw_set_alpha(0.75)

/* draw rectangle */ draw_roundrect(

/* x1 */ argument2-argument0,

/* y1 */ argument3+argument1+(string_height(argument4)/2),

/* x2 */ argument2+argument0+string_width(argument4),

/* y2 */ argument3-argument1-(string_height(argument4)/2),

/* outline */ false,

);
draw_set_color(c_black);
draw_set_alpha(1);
/* draw text */ draw_text(

/* x */ argument2,

/* y */ argument3,

/* text */ argument4

);

/* set horizontal alignment */ draw_set_halign(-1);

/* set vertical alignment */ draw_set_valign(-1);
