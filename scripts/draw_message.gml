/* Script: message_draw()

Draws the text scrolling across the dialog box.
Separates the speaker's name from the message, and
colours text according to your specifications.

___________________EXAMPLE___________________
msg = "Mom: Can you go get me some milk, %bBob%k?";
WILL OUTPUT SOMETHING LIKE:
+-----+
| Mom |
+-----+---------------------------+
| Can you get me some milk, Bob?  |
+---------------------------------+

With "Bob" written in blue, and the '?' in black.
*/

/* Make these variables forgotten after the script ends to save memory
Again, please refrain from using these variables elsewhere
in your game in case of unintended problems */
var char, charPos, charX, charY, colChange, speaker, msg;
charPos = 1;        //Position in the string to take the next character from 
charX = 0;          //x position of the next letter
charY = 0;          //y position of the next letter
colChange = false;  //If colour must be changed
draw_set_color(c_black); //Set the colour to black. 
//Draw the sprite for the dialog box in the correct place
draw_sprite(spr_textbox, 0, view_xview[0], view_yview[0] - sprite_get_height(spr_textbox));

msg = message_read();
/* NOTE:    If there is a colon : in your message, all text before it 
            will be placed into a separate bubble intended to be the speaker's name.
            If you do not have a colon, there will be no separate bubble.
            Feel free to change the character if you need colons in your dialog. */
var spkrchar;
spkrchar = ":";
if(string_pos(spkrchar, msg)) {
    //Cut out the speaker's name from the message, store it in speaker
    speaker = string_copy(msg, 0, string_pos(spkrchar, msg) - 1);
    msg = string_copy(msg, string_pos(spkrchar, msg) + 2, string_length(msg))
} else {
    speaker = "";
}
//Draw the speaker bubble if a speaker is given
if(speaker != "") {
    draw_set_color(c_white); //Set the colour to white for the background
    //Draw the background in the right proportions
    draw_roundrect(view_xview[0],
        view_yview[0] - sprite_get_height(spr_textbox) - 32,
        view_xview[0] + string_width(speaker) + 16,
        view_yview[0] - sprite_get_height(spr_textbox),
        false);
    draw_set_color(c_black); //Set the colour to black for the border and text
    //Draw the border around the background
    draw_roundrect(view_xview[0],
        view_yview[0] - sprite_get_height(spr_textbox) - 32,
        view_xview[0] + string_width(speaker) + 16,
        view_yview[0] - sprite_get_height(spr_textbox),
        true);
    //Write speaker's name in the box
    draw_text(view_xview[1] + 8, view_yview[1] + 8, speaker);
}
//Now draw the string, letter by letter. 
//pos is the current last letter to show, incremented once each step.
repeat(pos) {
    //Get the next character
    char = string_char_at(msg, charPos);
    /* Change the colour if specified (char = '%').
    Feel free to change this if you want to use %
    in your string 
                |
                v           */
    if(char == "%") {
        /* Indicate that the colour should be changed to the next 
        character's value, rather than write the letter */
        colChange = true;
    } else {
        //Change the colour depending on the letter after the %
        if(colChange) {
            switch(char) {
                case "r": //Red
                    draw_set_color(c_red);
                    break;
                case "g": //Green
                    draw_set_color(c_green);
                    break;
                case "b": //Blue
                    draw_set_color(c_blue);
                    break;
                case "c": //Cyan
                    draw_set_color(make_color_rgb(0, 255, 255));
                    break;
                case "m": //Magenta
                    draw_set_color(make_color_rgb(255, 0, 255));
                    break;
                case "y": //Yellow
                    draw_set_color(c_yellow);
                    break;
                case "p": //Purple
                    draw_set_color(c_purple);
                    break;
                /* Add more colours here if you like. Just follow the same syntax as the others:
                case "SYMBOL":
                    draw_set_color(THE COLOUR);
                    break;
                */
                case "k": default: //Black. If the letter is not found, also set the colour to black
                    draw_set_color(c_black);
                    break;
            }
            colChange = false;
        } else {
            if(char != "#") {
                //Draw the string and add the width of the letter to charX
                //Draw the current letter
                draw_text(view_xview[1] + 16 + charX, view_yview[1] + 48 + charY, char);
                charX += string_width(char);
            } else {
                //Start the next line
                charY += string_height("A"); //'A' just used to get the letter height
                //Bring charX back to 0
                charX = 0;
            }
        }
    }
    //Move on to the next character
    charPos += 1;
}
//Move the position farther, not extending past the end of the string
pos += 1;
pos = clamp(pos, 0, string_length(message_read()));
