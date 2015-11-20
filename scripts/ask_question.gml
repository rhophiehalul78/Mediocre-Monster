var inst;
add_message(argument0);
inst = instance_create(view_xview[1] + 16 , view_yview[1] + view_hview[1] - sprite_get_height(sButton) - 16, InputButton);
inst.text[0] = argument1;
inst.text[1] = argument2;
inst.caller = argument3;