///turn_sandrajilt()
// Check for low HP and use potion on him/her
/*
if (((hero[0].currenthp <= (hero[0].maxhp * 0.3)) && !hero[0].isDead) 
    || ((hero[1].currenthp <= (hero[1].maxhp * 0.3)) && !hero[1].isDead) 
    || ((hero[2].currenthp <= (hero[2].maxhp * 0.3)) && !hero[2].isDead))
{
    timeline_index = tl_usePotion;
}
else if (check_monster_status_effect())
{
    var actionDeterminer = irandom(10);
    switch(true)
    {
        // Do action depending on their percentage of chance
        case 0: 
            timeline_index = tl_inflictPoison;
            break;
        case 1:
        case 2:
            timeline_index = tl_inflictSleep;
            break;
        case 3:
            timeline_index = tl_inflictRegen;
            break;
        case 4:
        case 5:
            timeline_index = tl_inflictSlow;
            break;
        default:
            timeline_index = tl_sandrajiltAttack;
            break;
    }
}
else
{
    timeline_index = tl_sandrajiltAttack;
}
*/
   timeline_index = tl_sandrajiltAttack; 
timeline_position = 0;
timeline_running = 1;

