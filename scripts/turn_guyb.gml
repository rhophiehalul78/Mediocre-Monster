///turn_guyb()
turn_rand = irandom_range(1, 10);
//taunt
if(turn_rand < 6) && (taunt_enabled)
{
    timeline_index = tl_heroattack;
    timeline_position = 0;
    timeline_running = 1;
}
else
{
    if (hero[0].currenthp <= (maxhp * 0.3) || hero[1].currenthp <= (maxhp * 0.3) || hero[2].currenthp <= (maxhp * 0.3))
    {
        timeline_index = tl_usePotion;
    }
    else
    {
        timeline_index = tl_heroattack;
    }
    
    timeline_position = 0;
    timeline_running = 1;
}
