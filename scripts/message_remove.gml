/* Script: message_remove()

Removes the first message in the queue.
Used once the user has read it to remove from screen and memory.
Also resets pos to 0 for the next string to appear.
*/
ds_queue_dequeue(message);
pos = 0;
