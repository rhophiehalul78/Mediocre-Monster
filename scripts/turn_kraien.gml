///turn_kraien()
if(irandom_range(1, 10) < 7)
{
    timeline_index = tl_heroattack;    
}
else
{
    // Check for low HP and use potion on him/her
    if (((hero[0].currenthp <= (hero[0].maxhp * 0.3)) && !hero[0].isDead) 
    || ((hero[1].currenthp <= (hero[1].maxhp * 0.3)) && !hero[1].isDead) 
    || ((hero[2].currenthp <= (hero[2].maxhp * 0.3)) && !hero[2].isDead))
    {
        timeline_index = tl_usePotion;
    }
    else
    {
        if(hero[0].agilityMultiplier > 1 || hero[1].agilityMultiplier > 1 || hero[2].agilityMultiplier > 1)
        {
            timeline_index = tl_heroattack;  
        }
        else
        {
            timeline_index = tl_inflictHaste;
        }
    }
}

timeline_position = 0;
timeline_running = 1;
