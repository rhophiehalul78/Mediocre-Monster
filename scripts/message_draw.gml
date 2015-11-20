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
var char, charPos, charX, charY, colChange, speaker, msg, orientation;
charPos = 1;        //Position in the string to take the next character from 
charX = 0;
                                                                                     
                                                                                              
//x position of the next letter
charY = 0;          //y position of the next letter
colChange = false;  //If colour must be changed
xpadding = 38;
ypadding = 12;
messageboxBorderThicknessX = 38;
messageboxBorderThicknessY = 38;
lineCharacterLimit = 36000;
lineCharacterCount = 0;
lineCount = 0;
lineLimit = 5;

draw_set_color(c_black); //Set the colour to black. 
draw_set_font(fnt_messagebox);

/* NOTE:    If there is a colon : in your message, all text before it 
            will be placed into a separate bubble intended to be the speaker's name.
            If you do not have a colon, there will be no separate bubble.
            Feel free to change the character if you need colons in your dialog. */
msg = message_read();
bust = bust_read();

//Cut out the bust's name from the orientation
    
var spkrchar;
spkrchar = ":";

if(string_pos(spkrchar, msg)) 
{
    //Cut out the speaker's name from the message, store it in speaker
    speaker = string_split(msg,0,":");
    orientation = string_split(msg,2,":");
    msg = string_split(msg,1,":");     
} 
else 
{
    speaker = "";
}

//Draw the sprite for the dialog box and nameplate in the correct place

if(speaker != "") 
    // display bust
    {
        if(orientation == "R")
        {
            draw_sprite(bust, 0, view_xview[0] + 800, view_yview[0] + view_hview[0] - sprite_get_height(spr_textbox) - sprite_get_height(spr_nameplate) - ypadding - 40);
        }
        else
        {
            draw_sprite_ext(bust, 0, view_xview[0] + 180, view_yview[0] + view_hview[0] - sprite_get_height(spr_textbox) - sprite_get_height(spr_nameplate) - ypadding - 40, -1, 1, 0, c_white, 1);
        }
    
        //draw msgbox
        draw_sprite(spr_textbox, 0, view_xview[0] + xpadding, view_yview[0] + view_hview[0] - sprite_get_height(spr_textbox) - ypadding);
    
        // draw nameplate
        draw_sprite_ext(spr_nameplate, 0, view_xview[0] + xpadding, view_yview[0] + view_hview[0] - sprite_get_height(spr_textbox) - sprite_get_height(spr_nameplate) - ypadding + 24,0.75,0.75,0,c_white,1);
    
        // draw name on the nameplate
        draw_set_color(c_white);
        draw_set_font(fnt_bubblegum);
        draw_text(view_xview[0] + xpadding + 46, view_yview[0] + view_hview[0] - sprite_get_height(spr_textbox) - sprite_get_height(spr_nameplate) - ypadding + 52, speaker);
         
}
draw_set_color(c_black);

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
        } 
        else 
        {            
                draw_set_font(fnt_rmTypewriter);
                if(char != "#") {
                    //Draw the string and add the width of the letter to charX
                    //Draw the current letter
                    draw_text(view_xview[0] + xpadding + messageboxBorderThicknessX + charX, view_yview[0] + view_hview[0] - sprite_get_height(spr_textbox) - ypadding + messageboxBorderThicknessY + charY + 10, char);                
                    charX += string_width(char);
                    lineCharacterCount += charX;
                    show_debug_message(string(lineCharacterCount));
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

if(pos != string_length(message_read())) { 
    //Play sound here if you have one. I don't have one... so... that's why I didn't
}
