///process_dead_character(actingObject)
with(argument0)
{
    currenthp = 0;
    actingObject.isDead = 1;                    
    sprite_index = death_sprite;
    audio_play_sound(sfx_roar,1,0);
    image_index = 0;
    image_speed = 0.3;
    isPoisoned = false;
    agilityMultiplier = 1;
    hasteTurnCounter = 0;
    slowTurnCounter = 0;
    isSleeping = false;
    isRegening = false;
}
