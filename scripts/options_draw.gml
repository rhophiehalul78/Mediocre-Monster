/*options_draw()
argument0 -> array of string options
*/

var messageOptions;
messageOptions = options_read();
draw_set_font(fnt_rmTypewriterOptions);
draw_set_colour(c_black);



switch(array_length_1d(messageOptions))
{
    case 1:            
        draw_set_font(fnt_mrsMonster);
        draw_set_halign(fa_center);
        draw_text(view_xview[0] + (view_wview[0] / 2), view_yview[0] + (view_hview[0] / 2), messageOptions[0]);
        
        if(instance_exists(obj_controller))
        {
            obj_controller.optionCount = 1;
        }
        draw_set_halign(fa_left);
        break;
    case 2:
        // create dialog box and display text
        draw_sprite(spr_dialogOptions, 0, view_xview[0] + (view_wview[0] / 2) - (sprite_get_width(spr_dialogOptions)/2)
            , view_yview[0] + (view_hview[0] / 3) - (sprite_get_height(spr_dialogOptions)/2));
        draw_text(view_xview[0] + (view_wview[0] / 2) - (sprite_get_width(spr_dialogOptions)/2) + 30
            , view_yview[0] + (view_hview[0] / 3) - (sprite_get_height(spr_dialogOptions)/2) + 52, messageOptions[0]);
        // create dialog box and display text
        draw_sprite(spr_dialogOptions, 0, view_xview[0] + (view_wview[0] / 2) - (sprite_get_width(spr_dialogOptions)/2)
            , view_yview[0] + (view_hview[0] / 3) - (sprite_get_height(spr_dialogOptions)/2) + 130);
        draw_text(view_xview[0] + (view_wview[0] / 2) - (sprite_get_width(spr_dialogOptions)/2) + 30
            , view_yview[0] + (view_hview[0] / 3) - (sprite_get_height(spr_dialogOptions)/2) + 182, messageOptions[1]); 
        
        if(instance_exists(obj_controller))
        {
            obj_controller.optionCount = 2;
        }       
        break;
    case 3:
        // create dialog box and display text
        draw_sprite(spr_dialogOptions, 0, view_xview[0] + (view_wview[0] / 2) - (sprite_get_width(spr_dialogOptions)/2)
            , view_yview[0] + (view_hview[0] / 5) - (sprite_get_height(spr_dialogOptions)/2));
        draw_text(view_xview[0] + (view_wview[0] / 2) - (sprite_get_width(spr_dialogOptions)/2) + 30
            , view_yview[0] + (view_hview[0] / 5) - (sprite_get_height(spr_dialogOptions)/2) + 52, messageOptions[0]);
        
        // create dialog box and display text
        draw_sprite(spr_dialogOptions, 0, view_xview[0] + (view_wview[0] / 2) - (sprite_get_width(spr_dialogOptions)/2)
            , view_yview[0] + (view_hview[0] / 5) - (sprite_get_height(spr_dialogOptions)/2) + 130);
         draw_text(view_xview[0] + (view_wview[0] / 2) - (sprite_get_width(spr_dialogOptions)/2) + 30
            , view_yview[0] + (view_hview[0] / 5) - (sprite_get_height(spr_dialogOptions)/2) + 182, messageOptions[1]);
        
            
        // create dialog box and display text
        draw_sprite(spr_dialogOptions, 0, view_xview[0] + (view_wview[0] / 2) - (sprite_get_width(spr_dialogOptions)/2)
            , view_yview[0] + (view_hview[0] / 5) - (sprite_get_height(spr_dialogOptions)/2) + 260);
        draw_text(view_xview[0] + (view_wview[0] / 2) - (sprite_get_width(spr_dialogOptions)/2) + 30
            , view_yview[0] + (view_hview[0] / 5) - (sprite_get_height(spr_dialogOptions)/2) + 314, messageOptions[2]);
        
        if(instance_exists(obj_controller))
        {
            obj_controller.optionCount = 3;
        }
        
        break;
    case 4:
        draw_sprite(spr_dialogOptions, 0, view_xview[0] + (view_wview[0] / 2) - (sprite_get_width(spr_dialogOptions)/2)
            , view_yview[0] + (view_hview[0] / 7) - (sprite_get_height(spr_dialogOptions)/2));
        draw_sprite(spr_dialogOptions, 0, view_xview[0] + (view_wview[0] / 2) - (sprite_get_width(spr_dialogOptions)/2)
            , (view_yview[0] + (view_hview[0] / 7) - (sprite_get_height(spr_dialogOptions)/2)) * 4);
        draw_sprite(spr_dialogOptions, 0, view_xview[0] + (view_wview[0] / 2) - (sprite_get_width(spr_dialogOptions)/2)
            , (view_yview[0] + (view_hview[0] / 7) - (sprite_get_height(spr_dialogOptions)/2)) * 7);
        draw_sprite(spr_dialogOptions, 0, view_xview[0] + (view_wview[0] / 2) - (sprite_get_width(spr_dialogOptions)/2)
            , (view_yview[0] + (view_hview[0] / 7) - (sprite_get_height(spr_dialogOptions)/2)) * 10);
        if(instance_exists(obj_controller))
        {
            obj_controller.optionCount = 4;
        }
        break;
}
