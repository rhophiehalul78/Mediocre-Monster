///turn_rust()
if(irandom_range(1, 10) < 8)
{
    timeline_index = tl_heroattack;    
}
else
{
    timeline_index = tl_inflictHaste;  
}

timeline_position = 0;
timeline_running = 1;
