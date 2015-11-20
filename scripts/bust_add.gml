/* Script: bust_add(str)
argument0 -> The bust to display on screen (Sprite)

Adds the given bust to the bust queue. Returns nothing
*/
var bustPic;
bustPic = argument0;
ds_queue_enqueue(busts, bustPic);
