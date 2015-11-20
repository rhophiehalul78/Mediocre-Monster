/*dialog_options(options)
argument0 -> array of string options
*/

var dialogOptions;
dialogOptions = argument0;

switch(array_length_1d(dialogOptions))
{
    case 1:
        draw_sprite(spr_dialogOptions, 0, view_xview[0], view_yview[0]);
        break;
    case 2:
        draw_sprite(spr_dialogOptions, 0, view_xview[0], view_yview[0]);
        break;
    case 3:
        draw_sprite(spr_dialogOptions, 0, view_xview[0], view_yview[0]);
        break;
    case 4:
        draw_sprite(spr_dialogOptions, 0, view_xview[0], view_yview[0]);
        break;
}
