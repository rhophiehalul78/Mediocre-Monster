/* Script: options_add(array)
argument0 -> The array to contain all dialog options

Adds the given array to the dialogOptions queue. Returns nothing
*/
var opt;
opt = argument0;
ds_queue_enqueue(dialogOptions, opt);
