///check_monster_status_effect()

/********************************************************************
* returns true if any monster has status effect                     *
* returns false if all monster has normal status                    *
*                                                                   *
* DEV   DATE        DESCRIPTION                                     *
* RM    10/20/2015  Initial code to help with determining actions   *
                    for heroes' turn scripts                        *
*********************************************************************/

var hasNoStatus = true;

for(var i = 0; i <= 2; i++)
{
    with(monster[i])
    {
        if (isPoisoned || isSleeping || agilityMultiplier < 1)
        {
            hasNoStatus = false;
            break;
        }
    }
}

return hasNoStatus;

