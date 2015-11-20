///scr_draw_messagebox(string text, real text_length, real padding, real talking_object, color background_color, bool force_text_below_object);

var text = argument0;       // Text for the box
var len = argument1;        // Text wrap width
var padding = argument2;    // Space between text and border
var obj = argument3;        // The object speaking. (message box points to them)
var bak_color = argument4;  // Color of the background
var force = argument5;      // Force box to draw below object

if(!instance_exists(obj) /* talker died */ || string(text) == "" /* nothing to say */) return 1;

var w = len+padding*2;
var height = string_height_ext(text, -1, len);
var h2 = height+padding*2;
var xx = obj.x+20;
//var yy = obj.y - padding*4 - obj.sprite_height - height;
var yy = obj.y - padding*4  - height - obj.sprite_height/2;
xx -= max(0,(xx+len+padding*4)-(room_width /* change to view_xview[x]+view_wview[x] for game with views */));

if(yy < 0 || force)
{
    yy = obj.y + obj.sprite_height + padding*2;
    draw_triangle(xx, obj.y+obj.sprite_height/2*.5+5, xx-padding,yy-padding+1,xx+padding,yy-padding+1,0);
}
else
{
    draw_set_color(c_white);
    draw_triangle(xx, obj.y-obj.sprite_height/2*.5-5, xx+padding,yy+height+padding*2-1, xx-padding,yy+height+padding*2-1,0);
}

draw_set_color(c_white);
draw_roundrect(xx-padding,yy-padding,xx+len+padding*3,yy+height+padding*3,0);
draw_rectangle_colour(xx,yy,xx+w,yy+h2,bak_color,bak_color,bak_color,bak_color,0);

draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_font(-1);
draw_set_color(c_white);
draw_text_ext(xx+padding+len*.5,yy+padding,text,-1,len);

return 0;
