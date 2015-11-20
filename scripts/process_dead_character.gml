///process_dead_character(actingObject)
with(argument0)
{
    currenthp = 0;
    isDead = 1;                    
    sprite_index = death_sprite;
    audio_play_sound(death_sfx,1,0);
    image_index = 0;
    image_speed = 0.3;
    isPoisoned = false;
    agilityMultiplier = 1;
    hasteTurnCounter = 0;
    slowTurnCounter = 0;
    isSleeping = false;
    isRegening = false;
    
    // delete character in the process turn queue
    while(ds_priority_find_priority(turnOrder, argument0) != undefined)
    {
        ds_priority_delete_value(turnOrder, argument0);
    }
}
