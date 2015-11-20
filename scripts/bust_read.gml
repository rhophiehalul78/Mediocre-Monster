/* Script: message_read()

Returns the first object in the bust queue.
Does not remove the object from the queue.
*/
return ds_queue_head(busts);
