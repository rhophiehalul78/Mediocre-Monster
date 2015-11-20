/// turn_end_handler()
// handles whose turn is it next and performs any calculations and process before granting their turn
turnCount++;

// If turn queue is empty, repopulate
if(ds_priority_empty(turnOrder))
{ 
    for(i=0; i<=2; i++)
    {
        if(!hero[i].isDead)
        {
            ds_priority_add(turnOrder,hero[i],hero[i].agility * hero[i].agilityMultiplier);
        }
        if(!monster[i].isDead && monster[i].isActive)
        {
            ds_priority_add(turnOrder,monster[i],monster[i].agility * monster[i].agilityMultiplier);
        }
    }
}

display_turnPanel();

if((!monster[0].isDead && monster[0].isActive) || (!monster[1].isDead && monster[1].isActive) || (!monster[2].isDead && monster[2].isActive))
{
    if(!ds_priority_empty(turnOrder))
    {
        actingObject = ds_priority_delete_max(turnOrder);
        
        var aliveCharacterCount = 0;
        if(!monster[0].isDead && monster[0].isActive)
        {
            aliveCharacterCount++;
        }
        if(!monster[1].isDead && monster[1].isActive)
        {
            aliveCharacterCount++;
        }
        if(!monster[2].isDead && monster[2].isActive)
        {
            aliveCharacterCount++;
        }
        if(!hero[0].isDead)
        {
            aliveCharacterCount++;
        }
        if(!hero[1].isDead)
        {
            aliveCharacterCount++;
        }
        if(!hero[2].isDead)
        {
            aliveCharacterCount++;
        }
    
        // add new priority queue for acting object, this might need revision to improve the turn flow
        ds_priority_add(turnOrder,actingObject,(actingObject.agility * actingObject.agilityMultiplier) + ((floor(turnCount/aliveCharacterCount)+ 1) * -100));
        show_debug_message(string((actingObject.agility * actingObject.agilityMultiplier) + ((floor(turnCount/aliveCharacterCount)+ 1) * -100)) + ":" + actingObject.hname);
        
        // Check acting object's state at end of its turn and act appropriately
        with(actingObject)
        {     
            // Determine if character's haste or slow status is gone             
            if(agilityMultiplier > 1 && hasteTurnCounter <= 4)
            {
                hasteTurnCounter++;
            }
            else if (agilityMultiplier < 1 && slowTurnCounter <= 4)
            {
                slowTurnCounter++;                
            }
            else
            {
                // reset acting object to normal speed state
                agilityMultiplier = 1;
                hasteTurnCounter = 0;
                slowTurnCounter = 0;
                stateSpeed = 0.4;
            }
            
            
            if (!isDead && !isSleeping)
            {
                if (isRegening && regenTurnCounter <= 15)
                {
                    draw_battletext_outline(string(floor(maxhp * 0.05)),x,y,c_black,c_green);
                    currenthp += floor(maxhp * 0.07);
                    clamp(currenthp, 0, maxhp);
                    regenTurnCounter++;
                }
                else
                {
                    isRegening = false;
                    regenTurnCounter = 0;
                }
            
                if(isPoisoned && poisonTurnCounter <= 15)
                {
                    draw_battletext_outline(string(floor(maxhp * 0.05)),x,y,c_black,c_white);
                    currenthp -= floor(maxhp * 0.05);
                    if(currenthp <= 0)
                    {
                        process_dead_character(actingObject);
                    }
                    poisonTurnCounter++;
                }
                else
                {
                    isPoisoned = false;
                    poisonTurnCounter = 0;
                }
                
                if(creatureType == "monster")
                {
                    turn_initialize();
                }
                else
                {
                    script_execute(turn_script);
                }
            }
            else
            {
                if(isSleeping && sleepTurnCounter <= 6)
                {                    
                    sleepTurnCounter++;
                }
                else
                {
                    isSleeping = false;
                }
                turn_end_handler();
            }
        }
    }
}
