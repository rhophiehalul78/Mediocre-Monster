/* Script: message_add(str)
argument0 -> The string to display on screen (String)

Adds the given string to the message queue. Returns nothing
*/
var str;
str = argument0;
ds_queue_enqueue(message, str);
