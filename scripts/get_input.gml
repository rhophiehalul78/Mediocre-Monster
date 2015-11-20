var str, obj;
str = argument0;
message_add(str);
keyboard_string = argument1;
obj = instance_create(view_xview[1] + 16, view_yview[1] + view_hview[1] - sprite_get_height(sInput) - 16, GetInput);
obj.caller = argument2;
