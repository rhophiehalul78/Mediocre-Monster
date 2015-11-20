///turn_tank()

turn_rand = irandom_range(1, 10);


if(turn_rand<6)&&(taunt_enabled){//taunt
timeline_index = tl_herotaunt;
timeline_position = 0;
timeline_running = 1;
}
else
{//normal attack
timeline_index = tl_heroattack;
timeline_position = 0;
timeline_running = 1;
}
