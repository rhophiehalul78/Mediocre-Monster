///turn_priest()

turn_rand = irandom_range(1, 10);


if(turn_rand<11){//heal
timeline_index = tl_heroheal;
timeline_position = 0;
timeline_running = 1;
}
else
{//normal attack
timeline_index = tl_heroattack;
timeline_position = 0;
timeline_running = 1;
}
